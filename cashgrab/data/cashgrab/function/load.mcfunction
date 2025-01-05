# load.mcfunction
#
# Arguments: (none)

# Version number (= major * 1000000 + minor * 1000 + patch)
scoreboard players set CASHGRAB_VERSION_NUMBER num 0010001

function cashgrab:runtime_config

# Removes t_debug tag from all players when not in developer mode
execute if score DEVELOPER_MODE num matches 0 run tag @a remove t_debug

# gamerules
gamerule mobGriefing false
gamerule doMobLoot false
gamerule doFireTick false
gamerule doMobSpawning false
gamerule keepInventory true
gamerule commandBlockOutput false
gamerule doVinesSpread false
gamerule doTraderSpawning false
gamerule doWeatherCycle false
gamerule doDaylightCycle false
gamerule fallDamage false
gamerule freezeDamage false
gamerule naturalRegeneration false
gamerule spawnRadius 3
gamerule projectilesCanBreakBlocks false

difficulty normal

setworldspawn 0 100 0

# =============================
# General player info

# Count of number of pms that operated on the player. This value should always be 1.
scoreboard objectives add pm_count dummy

# Enumerated value of player's current state:
#	0	=	Transition to In Pregame Lobby
#	1	=	In Pregame Lobby
#	10	=	Transition to Class-and-Trinket Select 
#	11	=	Class-and-Trinket Select (in spawn selection room)
#	20	=	Transition to Gameplay
#	21	=	Gameplay
scoreboard objectives add activity_state dummy

# Number of coins held
scoreboard objectives add coins minecraft.picked_up:minecraft.gold_nugget
scoreboard objectives add __coins_disp_ones dummy
scoreboard objectives add __coins_disp_tens dummy
scoreboard objectives add __coins_score dummy {"text":"Coins","color":"yellow"}

# --- Toss ability

# Class-configured length of ability cooldown, in ms
scoreboard objectives add ability_cfg_cd_ms dummy

# Current cooldown time remaining, in ms
scoreboard objectives add ability_cd_ms dummy

# Progress rate of ability recharge. Default is 50 ms / tick
scoreboard objectives add ability_cd_tickrate dummy

# Current cooldown time remaining, in secs, derived from ability_cd_ms
scoreboard objectives add ability_cd_display_secs dummy

# Class-configured ability max charge count
scoreboard objectives add ability_cfg_charges_max dummy

# Current number of ability charges
scoreboard objectives add ability_charges dummy

# --- Trinket

# Number of usages remaining
scoreboard objectives add trinket_charges dummy
scoreboard objectives add trinket_charges_max dummy
scoreboard objectives add __trinket_charges_prev dummy

# When nonzero, modifies charge count by value. Positive
#   values add charges (up to trinket_charges_max) while
#   negative values remove charges (to min of 0)
scoreboard objectives add trinket_charges_modify dummy

# 1 if holding trinket and 0 otherwise
scoreboard objectives remove trinket_held

# 1 if trinket is in offhand and 0 otherwise
#   The t_trinket_force_hotbar tag forces trinket to
#   to be drawn in hotbar.3
scoreboard objectives add trinket_in_offhand dummy

# --- Game objective-related

# Multiple different teams are not supported on this version of cashgrab
#	However, there is potential to add this feature in later versions
# team_id = 0 is guaranteed to be free-for-all
scoreboard objectives add team_id dummy

# =============================
# General purpose temporary variables typically used to perform conditionals on function arguments
#	Generally-speaking, if you call another function, assume that temp_A and temp_B are no longer valid
#	for the caller afterwards
scoreboard objectives add temp_A dummy
scoreboard objectives add temp_B dummy

# =============================
# Entity ID variables

# EIDs are reserved as follows:
# 	1	  - 9999  : Players
#	10001 - 19999 : Player Monitor ("pm") markers used to execute commands on player's behalf
#	20001+		  : Non-player and non-pm entities

# Players can set this to nonzero to emulate relogging onto the server
scoreboard objectives add reinitialize trigger

# EID of itself and its owner. Entities with no owner have eid_owner = 0
scoreboard objectives add eid_self dummy
scoreboard objectives add eid_owner dummy

# Used for comparisons. eid_compare == 0 means you found a match for some query about EIDs
scoreboard objectives add eid_compare dummy

# Used for issuing EIDs to players
scoreboard objectives add __eid_prev dummy

# Entity state regarding its EID:
#	eid_state == 0	:	Entity does not have a valid EID
#	eid_state == 1	:	Entity has a valid self EID
#	eid_state == 2	:	Entity has a valid self EID, missiles/raycasts can collide with them, and they can be grabbed
scoreboard objectives add eid_state dummy

# =============================
# Variables reserved for classes to use (prefix: "cv_"). These values are set to zero whenever you run #cashgrab:classes/pmt_equip_perclass
scoreboard objectives add cv_A dummy
scoreboard objectives add cv_B dummy
scoreboard objectives add cv_C dummy
scoreboard objectives add cv_D dummy
scoreboard objectives add cv_E dummy
scoreboard objectives add cv_F dummy
scoreboard objectives add cv_G dummy
scoreboard objectives add cv_H dummy

# =============================
# Player state variables (prefix: "ps_"). All of these use the same numbering to describe the player's state:
# 	-1 = Transition from TRUE to FALSE
# 	0 = FALSE
# 	1 = TRUE
# 	2 = Transition from FALSE to TRUE
#
#	Values -1 and 0 (e.g. "scores={ps_SCORE=..0}") are more false-y while 1 and 2 (e.g. "scores={ps_SCORE=1..}") are more truth-y

# Player state: falling (any time spent in the air)
scoreboard objectives add __fallDist minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add __falling_cur dummy
scoreboard objectives add __falling_prev dummy
scoreboard objectives add ps_falling dummy

# Player state: sneaking (holding down button)
scoreboard objectives add __sneakTime minecraft.custom:minecraft.sneak_time
scoreboard objectives add __sneaking_cur dummy
scoreboard objectives add __sneaking_prev dummy
scoreboard objectives add ps_sneaking dummy

# Player state: selected hotbar slot
scoreboard objectives add ps_selected_hotbar_slot dummy

# =============================
# Internally consumed events (prefix: "__iev_"). Classes may not consume these events
scoreboard objectives add __iev_drop minecraft.custom:minecraft.drop
scoreboard objectives add __iev_logout minecraft.custom:minecraft.leave_game

# =============================
# Listenable events (prefix: "evl_"). These values are set to zero at the end of every tick.
#	These events are shared between classes and trinkets. Neither should set these to zero.
scoreboard objectives add evl_death minecraft.custom:minecraft.deaths
scoreboard objectives add evl_player_kills minecraft.custom:minecraft.player_kills
scoreboard objectives add evl_jump minecraft.custom:minecraft.jump
scoreboard objectives add evl_dmg_absorbed minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add evl_dmg_dealt minecraft.custom:minecraft.damage_dealt
scoreboard objectives add evl_dmg_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add evl_coin_pickup minecraft.picked_up:minecraft.gold_nugget
scoreboard objectives add evl_crossbows minecraft.used:minecraft.crossbow
scoreboard objectives add evl_bows minecraft.used:minecraft.bow

# =============================
# Conusmable events (prefix: "evc_"). 
#	Classes and trinkets must set these to zero when they initialize and when they consume these events.
#	Trinkets are ran before classes for consuming events. If a class observes these events occurring,
#		the class can be sure that a trinket did not activate.
scoreboard objectives add evc_maps minecraft.used:minecraft.map
scoreboard objectives add evc_xpbottles minecraft.used:minecraft.experience_bottle
scoreboard objectives add evc_snowballs minecraft.used:minecraft.snowball
scoreboard objectives add evc_eggs minecraft.used:minecraft.egg
scoreboard objectives add evc_gold_axe_break minecraft.broken:minecraft.golden_axe
scoreboard objectives add evc_potions minecraft.used:minecraft.potion
scoreboard objectives add evc_splash_potions minecraft.used:minecraft.splash_potion

# =============================
# Readable statistics (prefix: "stat_").
scoreboard objectives add stat_hp health
scoreboard objectives add stat_alive_ticks minecraft.custom:minecraft.time_since_death

# =============================
# Number constants used for scoreboard math

scoreboard objectives add num dummy

# === Math constants

scoreboard players set NUM_ZERO num 0
scoreboard players set NUM_ONE num 1
scoreboard players set NUM_TWO num 2
scoreboard players set NUM_THREE num 3
scoreboard players set NUM_NEG_ONE num -1
scoreboard players set NUM_TEN num 10
scoreboard players set NUM_ONE_HUNDRED num 100
scoreboard players set NUM_ONE_THOUSAND num 1000

scoreboard players set NUM_360_DEG num 360

scoreboard players set NUM_TICKS_PER_SEC num 20

# === Missile constants

scoreboard players set NUM_MISSILE_TRACKING_DIVISOR num 1

# === Raycast constants

scoreboard players set NUM_RAYCAST_STEPS_PER_M num 2

# === end_reason enum values
scoreboard players set NUM_END_REASON_CLEANUP num 0
scoreboard players set NUM_END_REASON_CLEANUP_PLAYER_DEATH num 1
scoreboard players set NUM_END_REASON_EXPIRE num 10
scoreboard players set NUM_END_REASON_TERRAIN_COLLISION num 20
scoreboard players set NUM_END_REASON_ENTITY_COLLISION num 30

# === Coin mechanics configurable parameters

# Goal number of coins to reach to win the game
scoreboard players add GOAL coins 0
execute if score GOAL coins matches 0 run scoreboard players set GOAL coins 100

scoreboard players set NUM_COIN_SPILLING_THRESHOLD num 100

# See runtime_config for more info on DEVELOPER_MODE
execute if score DEVELOPER_MODE num matches 0 run function cashgrab:base/gt_display_coin_score

# When player dies, their coin count is divded by this number and the other portion is given to coin shower
scoreboard players add NUM_COINSHOWER_EXCHANGE_DIVISOR num 0
execute if score NUM_COINSHOWER_EXCHANGE_DIVISOR num matches 0 run scoreboard players set NUM_COINSHOWER_EXCHANGE_DIVISOR num 2

# Target time for coin showers to dispense coins, in ticks
scoreboard players add NUM_COINSHOWER_TARGET_TIME_TICKS num 0
execute if score NUM_COINSHOWER_TARGET_TIME_TICKS num matches 0 run scoreboard players set NUM_COINSHOWER_TARGET_TIME_TICKS num 135

# Maximum period for coin drops by coin showers, in ticks
scoreboard players add NUM_COINSHOWER_MAX_PERIOD_TICKS num 0
execute if score NUM_COINSHOWER_MAX_PERIOD_TICKS num matches 0 run scoreboard players set NUM_COINSHOWER_MAX_PERIOD_TICKS num 7

# Number of coins awarded by stepping on a coin plate
scoreboard players add NUM_COINS_PER_COINPLATE num 0
execute if score NUM_COINS_PER_COINPLATE num matches 0 run scoreboard players set NUM_COINS_PER_COINPLATE num 2

# Coin plate cooldown timer, in ticks
scoreboard players add NUM_COINPLATE_CD_TICKS num 0
execute if score NUM_COINPLATE_CD_TICKS num matches 0 run scoreboard players set NUM_COINPLATE_CD_TICKS num 300

# === Misc. global variables

# Tracks the state of the game: 0 = no game active, 1 = game is running
scoreboard players add NUM_GAMESTATE num 0

# 1 if the player count has changed this tick, and 0 otherwise
scoreboard players set NUM_PLAYERCOUNT_CHANGED num 0

scoreboard players set TEAM_RED coins 0
scoreboard players set TEAM_BLUE coins 0

scoreboard players add DEVELOPER_MODE num 0

# =============================
# Entity position calculated via util/pe_record_position, in mm

scoreboard objectives add pos_x_mm dummy
scoreboard objectives add pos_y_mm dummy
scoreboard objectives add pos_z_mm dummy

# =============================
# Entity facing vector calculated via util/pe_calc_facing_vector

# Cartesian components, in mm
scoreboard objectives add facing_vector_x_mm dummy
scoreboard objectives add facing_vector_y_mm dummy
scoreboard objectives add facing_vector_z_mm dummy

# Angular components, in millidegrees
scoreboard objectives add facing_vector_yaw_mdeg dummy
scoreboard objectives add facing_vector_pitch_mdeg dummy

# =============================
# Values used for missiles
scoreboard objectives add mis_lifetime_ticks dummy

# Velocity inherited from initial speed, in mm/tick
scoreboard objectives add mis_base_vel_x_mmpt dummy
scoreboard objectives add mis_base_vel_y_mmpt dummy
scoreboard objectives add mis_base_vel_z_mmpt dummy

# Vertical velocity gained per tick, in mm/tick^2
scoreboard objectives add mis_gravity_const_mmpt2 dummy

# Vertical velocity from gravity, in mm/tick
scoreboard objectives add mis_gravity_vel_y_mmpt dummy

# Pitch and yaw adjustments modified by missile's func_npe_tick, in millidegrees
scoreboard objectives add mis_func_tick_dyaw_mdeg dummy
scoreboard objectives add mis_func_tick_dpitch_mdeg dummy

# Pitch and yaw of direction heading towards potential tracking target, in millidegrees
scoreboard objectives add mis_tracking_dyaw_mdeg dummy
scoreboard objectives add mis_tracking_dpitch_mdeg dummy

# Tracking angle cutoff values calculated when you apply t_tracking_init to a missile
scoreboard objectives add __mis_tracking_giveup_min_mdeg dummy
scoreboard objectives add __mis_tracking_giveup_max_mdeg dummy
scoreboard objectives add __mis_tracking_adjust_min_mdeg dummy
scoreboard objectives add __mis_tracking_adjust_max_mdeg dummy

# Summation of all physics effects on a missile
scoreboard objectives add mis_sum_vel_x_mmpt dummy
scoreboard objectives add mis_sum_vel_y_mmpt dummy
scoreboard objectives add mis_sum_vel_z_mmpt dummy

# = if either col_terrain or col_entity == 1
scoreboard objectives add __mis_has_collided dummy

# =============================
# Values used for collision detection

# Missile / raycast has collided with terrain and entities, respectively
scoreboard objectives add __col_terrain_count dummy
scoreboard objectives add col_terrain dummy
scoreboard objectives add col_entity dummy

# =============================
# Values used for raycasting
scoreboard objectives add rc_steps_remaining dummy
scoreboard objectives add rc_align_camera dummy
scoreboard objectives add rc_fit_player dummy

# =============================
# Values used for timers
scoreboard objectives add tmr_lifetime_ticks dummy
scoreboard objectives add tmr_anchor_pos dummy

# =============================
# Values used for coin plates
scoreboard objectives add __coinplate_timer_ticks dummy

# =============================
# Values used for coin showers
scoreboard objectives add __coinshower_coins dummy
scoreboard objectives add __coinshower_timer_ticks dummy
scoreboard objectives add __coinshower_period_ticks dummy

# =============================
# Values used for coin spilling
scoreboard objectives add __coinspilling_timer_ticks dummy
scoreboard objectives add __coinspilling_announcement_lockout_ticks dummy

# =============================
# Values used for grab mechanics

# EID of entity grabbing this entity
#	Grabbed entities will be constantly teleported to the grabber and have no gravity
#	If the grabbed entity has the tag t_grab_release, grab ends
#		and this value is set back to zero.
scoreboard objectives add eid_grabbed_by dummy

# 	-1 = Transition from TRUE to FALSE
# 	0 = FALSE
# 	1 = TRUE
# 	2 = Transition from FALSE to TRUE
scoreboard objectives add grab_state dummy

# =============================
# Values used for stasis

# 	-1 = Transition from TRUE to FALSE
# 	0 = FALSE
# 	1 = TRUE
# 	2 = Transition from FALSE to TRUE
# Note: stasis_state is driven by the application of the t_stasis tag.
# 	stasis_state = -1..0 when t_stasis is not applied
# 	stasis_state = 1..2 when t_stasis is applied
#	stasis_state values of -1 and 2 can be used to know when to save/restore variables
#	the t_stasis_immune tag prevents the updating of stasis_state
#		and thus is unafected by the t_stasis tag.
#	the t_stasis tag is removed on every server tick and 
#		thus must be constantly applied to hold something in stasis
scoreboard objectives add stasis_state dummy

scoreboard objectives add stasis_reset_pos_timer dummy

scoreboard objectives add stasis_stored_x_pos_mm dummy
scoreboard objectives add stasis_stored_y_pos_mm dummy
scoreboard objectives add stasis_stored_z_pos_mm dummy

scoreboard objectives add stasis_stored_x_vel_mmpt dummy
scoreboard objectives add stasis_stored_y_vel_mmpt dummy
scoreboard objectives add stasis_stored_z_vel_mmpt dummy

scoreboard objectives add stasis_stored_arrow_crit dummy

# =============================
# Values used for class-and-trinket selection (CTS)

# Player selected class and trinket index number in cashgrab:game_info arrays
scoreboard objectives add __cts_selected_class_idx dummy
scoreboard objectives add __cts_selected_trinket_idx dummy

# page_idx is 0-based while page_num is 1-based
scoreboard objectives add __cts_classes_page_idx dummy
scoreboard objectives add __cts_classes_page_num dummy
scoreboard objectives add __cts_trinkets_page_idx dummy
scoreboard objectives add __cts_trinkets_page_num dummy

# =============================
# Teams

# Team used while in lobby
team add team_lobby {"type":"text","text":"Lobby"}
team modify team_lobby color gold
team modify team_lobby friendlyFire false
team modify team_lobby seeFriendlyInvisibles true
team modify team_lobby nametagVisibility always
team modify team_lobby collisionRule never 

# FFA Team
team add team_ffa {"type":"text","text":"FFA"}
team modify team_ffa color gold
team modify team_ffa friendlyFire true
team modify team_ffa seeFriendlyInvisibles false
team modify team_ffa nametagVisibility never
team modify team_ffa collisionRule always 

# FFA Team (CTS mode)
team add team_ffa_cts {"type":"text","text":"FFA"}
team modify team_ffa_cts color gold
team modify team_ffa_cts friendlyFire false
team modify team_ffa_cts seeFriendlyInvisibles false
team modify team_ffa_cts nametagVisibility hideForOtherTeams
team modify team_ffa_cts collisionRule never

# Coin Goal Team (used for displaying red team total)
team add team_coin_goal {"type":"text","text":"COIN_GOAL"}
team modify team_coin_goal color yellow
team join team_coin_goal GOAL

# =============================
# Class and Trinket info

scoreboard players set NUM_CTS_CLASSES_PAGE_SIZE num 15
scoreboard players set NUM_CTS_TRINKETS_PAGE_SIZE num 6

# Initialize cashgrab:game_info.classes roster list
data remove storage cashgrab:game_info classes
data modify storage cashgrab:game_info classes set value []

# Initialize cashgrab:game_info.trinkets roster list
data remove storage cashgrab:game_info trinkets
data modify storage cashgrab:game_info trinkets set value []

# Load cashgrab core classes
function cashgrab:load_post

# Allow plugins to add data to game_info and initialize themselves
function #cashgrab:gt_load_post

# Add NULL entries
data modify storage cashgrab:game_info classes prepend value {\
s_class_name:"NULL",\
func_pmt_init:"cashgrab:util/noop",\
func_pmt_inv:"cashgrab:util/noop",\
func_pmt_inv_ability_icon:"cashgrab:util/noop",\
func_pmtl_tick:"cashgrab:util/noop",\
func_pmtl_use_ability:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:base/cts/pmt_null_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

data modify storage cashgrab:game_info trinkets prepend value {\
s_trinket_name:"NULL",\
func_pmt_init:"cashgrab:util/noop",\
func_pmt_inv:"cashgrab:util/noop",\
func_pmtl_use_item:"cashgrab:util/noop",\
func_pmt_cts_icon:"cashgrab:base/cts/pmt_null_cts_inv_icon",\
evc_usage_score:"",\
}


# DEVELOPER MODE data
execute if score DEVELOPER_MODE num matches 1 run data modify storage cashgrab:game_info classes append value {\
s_class_name:"Mapmaker",\
func_pmt_init:"cashgrab:classes/mapmaker/pmt_mapmaker_init",\
func_pmt_inv:"cashgrab:classes/mapmaker/pmt_mapmaker_inv",\
func_pmt_inv_ability_icon:"cashgrab:classes/mapmaker/pmt_mapmaker_inv_ability_icon",\
func_pmtl_tick:"cashgrab:classes/mapmaker/pmtl_mapmaker_tick",\
func_pmtl_use_ability:"cashgrab:classes/mapmaker/pmtl_mapmaker_use_ability",\
func_pmt_cts_icon:"cashgrab:classes/mapmaker/pmt_mapmaker_cts_inv_icon",\
func_pmtl_cts_tick:"cashgrab:util/noop",\
}

execute if score DEVELOPER_MODE num matches 1 run data modify storage cashgrab:game_info trinkets append value {\
s_trinket_name:"Test Item",\
func_pmt_init:"cashgrab:trinkets/test_item/pmt_test_item_init",\
func_pmt_inv:"cashgrab:trinkets/test_item/pmt_test_item_inv",\
func_pmtl_use_item:"cashgrab:trinkets/test_item/pmtl_test_item_use_item",\
func_pmt_cts_icon:"cashgrab:trinkets/test_item/pmt_test_item_cts_inv_icon",\
evc_usage_score:"evc_eggs",\
}

# Calculate classes list quantites for later use
scoreboard players set NUM_CTS_CLASSES_LIST_LEN num 0
execute store result score NUM_CTS_CLASSES_LIST_LEN num run data get storage cashgrab:game_info classes

scoreboard players set NUM_CTS_CLASSES_PAGE_IDX_MAX num 0
scoreboard players operation NUM_CTS_CLASSES_PAGE_IDX_MAX num = NUM_CTS_CLASSES_LIST_LEN num
scoreboard players remove NUM_CTS_CLASSES_PAGE_IDX_MAX num 2
scoreboard players operation NUM_CTS_CLASSES_PAGE_IDX_MAX num /= NUM_CTS_CLASSES_PAGE_SIZE num

# Store max page number in cashgrab:cts_inv_args
execute store result storage cashgrab:cts_inv_args classes_page_num_max int 1 run scoreboard players add NUM_CTS_CLASSES_PAGE_IDX_MAX num 1
scoreboard players remove NUM_CTS_CLASSES_PAGE_IDX_MAX num 1

# Calculate trinkets list quantites for later use
scoreboard players set NUM_CTS_TRINKETS_LIST_LEN num 0
execute store result score NUM_CTS_TRINKETS_LIST_LEN num run data get storage cashgrab:game_info trinkets

scoreboard players set NUM_CTS_TRINKETS_PAGE_IDX_MAX num 0
scoreboard players operation NUM_CTS_TRINKETS_PAGE_IDX_MAX num = NUM_CTS_TRINKETS_LIST_LEN num
scoreboard players remove NUM_CTS_TRINKETS_PAGE_IDX_MAX num 2
scoreboard players operation NUM_CTS_TRINKETS_PAGE_IDX_MAX num /= NUM_CTS_TRINKETS_PAGE_SIZE num

# Store max page number in cashgrab:cts_inv_args
execute store result storage cashgrab:cts_inv_args trinkets_page_num_max int 1 run scoreboard players add NUM_CTS_TRINKETS_PAGE_IDX_MAX num 1
scoreboard players remove NUM_CTS_TRINKETS_PAGE_IDX_MAX num 1
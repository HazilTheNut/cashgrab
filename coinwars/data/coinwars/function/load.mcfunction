# load.mcfunction
#
# Arguments: (none)

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

# =============================
# General player info

# ID number of class assigned to a player. 0 = no class
scoreboard objectives add class dummy

# Number of coins held
scoreboard objectives add coins minecraft.picked_up:minecraft.gold_nugget
scoreboard objectives add __coins_disp_ones dummy
scoreboard objectives add __coins_disp_tens dummy
scoreboard objectives add __coins_score dummy {"text":"Coins","color":"yellow"}

# Ability cooldown remaining 
# note: ability_cd_secs = floor(ability_cd_ticks / 20) + (ability_cd_ticks >= 1)
scoreboard objectives add ability_cd_ticks dummy
scoreboard objectives add ability_cd_secs dummy

scoreboard objectives add ability_cfg_cooldown_ticks dummy
scoreboard objectives add ability_cfg_charges dummy

scoreboard objectives add ability_charges dummy

# Game objective-related
# team_id: 0 = ffa, 1 = red, 2 = blue
scoreboard objectives add team_id dummy

# =============================
# General purpose temporary variables typically used to perform conditionals on function arguments
#	Generally-speaking, if you call another function, assume that temp_A and temp_B are no longer valid
#	for the caller afterwards
scoreboard objectives add temp_A dummy
scoreboard objectives add temp_B dummy

# =============================
# Entity ID variables

# EID of itself and its owner. Entities with no owner have eid_owner = 0
scoreboard objectives add eid_self dummy
scoreboard objectives add eid_owner dummy

# Used for comparisons. eid_compare == 0 means you found a match for some query about EIDs
scoreboard objectives add eid_compare dummy

# Entity state regarding its EID:
#	eid_state == 0	:	Entity does not have a valid EID
#	eid_state == 1	:	Entity has a valid self EID
#	eid_state == 2	:	Entity has a valid self EID and missiles/raycasts can collide with them
scoreboard objectives add eid_state dummy

# =============================
# Variables reserved for classes to use (prefix: "cv_"). These values are set to zero whenever you run #coinwars:classes/pe_equip_perclass
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

# Player state: walking
scoreboard objectives add __walkDist minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add __walking_cur dummy
scoreboard objectives add __walking_prev dummy
scoreboard objectives add ps_walking dummy

# Player state: sprinting (on the ground)
scoreboard objectives add __sprintDist minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add __sprinting_cur dummy
scoreboard objectives add __sprinting_prev dummy
scoreboard objectives add ps_sprinting dummy

# Player state: crouching (moving while sneaking)
scoreboard objectives add __crouchDist minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add __crouching_cur dummy
scoreboard objectives add __crouching_prev dummy
scoreboard objectives add ps_crouching dummy

# Player state: falling (any time spent in the air)
scoreboard objectives add __fallDist minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add __falling_cur dummy
scoreboard objectives add __falling_prev dummy
scoreboard objectives add ps_falling dummy

# Player state: swimming ("sprinting" underwater)
scoreboard objectives add __swimDist minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add __swimming_cur dummy
scoreboard objectives add __swimming_prev dummy
scoreboard objectives add ps_swimming dummy

# Player state: onwater_walk
scoreboard objectives add __onwater_walkDist minecraft.custom:minecraft.walk_on_water_one_cm
scoreboard objectives add __onwater_walking_cur dummy
scoreboard objectives add __onwater_walking_prev dummy
scoreboard objectives add ps_onwater_walking dummy

# Player state: underwater_walk
scoreboard objectives add __underwater_walkDist minecraft.custom:minecraft.walk_under_water_one_cm
scoreboard objectives add __underwater_walking_cur dummy
scoreboard objectives add __underwater_walking_prev dummy
scoreboard objectives add ps_underwater_walking dummy

# Player state: climbing
scoreboard objectives add __climbDist minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add __climbing_cur dummy
scoreboard objectives add __climbing_prev dummy
scoreboard objectives add ps_climbing dummy

# Player state: climbing
scoreboard objectives add __aviateDist minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add __aviating_cur dummy
scoreboard objectives add __aviating_prev dummy
scoreboard objectives add ps_aviating dummy

# Player state: moving (either walking or sprinting on the ground)
scoreboard objectives add ps_moving dummy

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
scoreboard objectives add __iev_death minecraft.custom:minecraft.deaths
scoreboard objectives add __iev_logout minecraft.custom:minecraft.leave_game
scoreboard objectives add __iev_coin_pickup minecraft.picked_up:minecraft.gold_nugget

# =============================
# Class consumable events (prefix: "ev_"). These values are set to zero at the end of every tick
scoreboard objectives add ev_jump minecraft.custom:minecraft.jump
scoreboard objectives add ev_dmg_absorbed minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add ev_dmg_dealt minecraft.custom:minecraft.damage_dealt
scoreboard objectives add ev_dmg_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add ev_maps minecraft.used:minecraft.map
scoreboard objectives add ev_xpbottles minecraft.used:minecraft.experience_bottle
scoreboard objectives add ev_snowballs minecraft.used:minecraft.snowball
scoreboard objectives add ev_eggs minecraft.used:minecraft.egg
scoreboard objectives add ev_crossbows minecraft.used:minecraft.crossbow
scoreboard objectives add ev_gold_axe_break minecraft.broken:minecraft.golden_axe

# =============================
# Class readable statistics (prefix: "stat_").
scoreboard objectives add stat_hp health
scoreboard objectives add stat_alive_ticks minecraft.custom:minecraft.time_since_death

# =============================
# Number constants used for scoreboard math

scoreboard objectives add num dummy

scoreboard players set NUM_ZERO num 0
scoreboard players set NUM_NEG_ONE num -1
scoreboard players set NUM_TEN num 10
scoreboard players set NUM_ONE_HUNDRED num 100

scoreboard players set NUM_360_DEG num 360

scoreboard players set NUM_TICKS_PER_SEC num 20
scoreboard players set NUM_MISSILE_TRACKING_DIVISOR num 1
scoreboard players set NUM_RAYCAST_STEPS_PER_M num 2

scoreboard players set NUM_COINSHOWER_EXCHANGE_DIVISOR num 2

# Tracks the state of the game: 0 = no game active, 1 = ffa game, 2 = teams game
scoreboard players add NUM_GAMESTATE num 0

# Tracks player count to detect when players leave the game
scoreboard players set NUM_PLAYERCOUNT num 0
scoreboard players set NUM_PLAYERCOUNT_PREV num 0

# 1 if the player count has changed this tick, and 0 otherwise
scoreboard players set NUM_PLAYERCOUNT_CHANGED num 0

# Set to 1 to rebuild the coin scoreboard
scoreboard players set NUM_REBUILD_COINSCORE num 0

scoreboard players set GOAL coins 100
scoreboard players set GOAL __coin_score 100

scoreboard players set TEAM_RED coins 0
scoreboard players set TEAM_BLUE coins 0

scoreboard players set NUM_END_GAME num 0

scoreboard players set DEVELOPER_MODE num 0

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

# Vertical velocity from gravity, in mm/tick
scoreboard objectives remove mis_gravity_vy

# Vertical velocity gained per tick, in mm/tick^2
scoreboard objectives remove mis_gravity_const

# Velocity inherited from initial speed, in mm/tick
scoreboard objectives add mis_base_vel_x_mmpt dummy
scoreboard objectives add mis_base_vel_y_mmpt dummy
scoreboard objectives add mis_base_vel_z_mmpt dummy

# Vertical velocity gained per tick, in mm/tick^2
scoreboard objectives add mis_gravity_const_mmpt2 dummy

# Vertical velocity from gravity, in mm/tick
scoreboard objectives add mis_gravity_vel_y_mmpt dummy

# Pitch and yaw adjustments provided by missile's func_step, in millidegrees
scoreboard objectives add mis_func_step_dyaw_mdeg dummy
scoreboard objectives add mis_func_step_dpitch_mdeg dummy

# Pitch and yaw of direction heading towards potential tracking target, in millidegrees
scoreboard objectives add mis_tracking_dyaw_mdeg dummy
scoreboard objectives add mis_tracking_dpitch_mdeg dummy
scoreboard objectives add mis_tracking_min_angle_mdeg dummy
scoreboard objectives add mis_tracking_max_angle_mdeg dummy

# Summation of all physics effects on a missile
scoreboard objectives add mis_sum_vel_x_mmpt dummy
scoreboard objectives add mis_sum_vel_y_mmpt dummy
scoreboard objectives add mis_sum_vel_z_mmpt dummy

# =============================
# Values used for collision detection

# Missile / raycast has collided with terrain and entities, respectively
scoreboard objectives add __col_terrain_count dummy
scoreboard objectives add col_terrain dummy
scoreboard objectives add col_entity dummy

# = if either col_terrain or col_entity == 1
scoreboard objectives add has_collided dummy

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

scoreboard objectives add stasis_stored_x_pos_mm dummy
scoreboard objectives add stasis_stored_y_pos_mm dummy
scoreboard objectives add stasis_stored_z_pos_mm dummy

scoreboard objectives add stasis_stored_x_vel_mmpt dummy
scoreboard objectives add stasis_stored_y_vel_mmpt dummy
scoreboard objectives add stasis_stored_z_vel_mmpt dummy

scoreboard objectives add stasis_stored_arrow_crit dummy

# =============================
# Teams

# FFA Team
team add team_ffa {"type":"text","text":"FFA"}
team modify team_ffa color gold
team modify team_ffa friendlyFire true
team modify team_ffa seeFriendlyInvisibles false
team modify team_ffa nametagVisibility hideForOwnTeam
team modify team_ffa collisionRule always 

# Red Team
team add team_red {"type":"text","text":"RED"}
team modify team_red color red
team modify team_red friendlyFire false
team modify team_red seeFriendlyInvisibles true
team modify team_red nametagVisibility hideForOtherTeams
team modify team_red collisionRule pushOtherTeams

# Red Total Team (used for displaying red team total)
team add team_red_total {"type":"text","text":"RED_TOTAL"}
team modify team_red_total color light_purple
team join team_red_total RED_TEAM

# Blue Team
team add team_blue {"type":"text","text":"BLUE"}
team modify team_blue color blue
team modify team_blue friendlyFire false
team modify team_blue seeFriendlyInvisibles true
team modify team_blue nametagVisibility hideForOtherTeams
team modify team_blue collisionRule pushOtherTeams

# Red Total Team (used for displaying red team total)
team add team_blue_total {"type":"text","text":"BLUE_TOTAL"}
team modify team_blue_total color aqua
team join team_blue_total BLUE_TEAM

# Coin Goal Team (used for displaying red team total)
team add team_coin_goal {"type":"text","text":"COIN_GOAL"}
team modify team_coin_goal color yellow
team join team_coin_goal GOAL

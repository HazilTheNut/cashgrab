# base/pm_main.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Top-level function call for pms to be run every server tick
#
# Arguments: (none)

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# =============================
# Player ownership validation

# Increment player pm_count
scoreboard players add @a[tag=t_pm_owner,limit=1] pm_count 1

# If a player's pm count is greater than 1, some other pm already processed this player
# 	which means that player is owning multiple pms, which is a problem.
# This case is not expected to occur but this is a failsafe in case it somehow happens.
# Destroying this pm will resolve the issue as the player entity holds all of their data,
#	so pms can be freely be destroyed without worry of corrupting player data
execute if entity @a[tag=t_pm_owner,limit=1,scores={pm_count=2..}] run tellraw @a[tag=t_pm_owner] "An error has occurred with your session - reinitializing"
execute if entity @a[tag=t_pm_owner,limit=1,scores={pm_count=2..}] run scoreboard players set @s eid_owner 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={pm_count=2..}] run function cashgrab:base/pm_cleanup_if_ownerless
execute if entity @a[tag=t_pm_owner,limit=1,scores={pm_count=2..}] run return 0

# =============================
# Handle player deaths

# === Detect if player has died
execute if score @a[tag=t_pm_owner,limit=1] evl_death matches 1.. run function cashgrab:base/pm_cleanup_player_subs
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_create_coinshower
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:classes/pmtl_class_end with entity @s data.class_info
# Set dead player activity_state
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_death=1..}] activity_state 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_death=1..}] activity_state 10
# Tag dead player to handle when they respawn
tag @a[tag=t_pm_owner,limit=1,scores={evl_death=1..}] add t_died

# === Detect if player has respawned
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..}] add dtm_send_to_lobby
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..}] add dtm_send_to_spawn_select
tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..}] remove t_died

# =============================
# Class and trinket selection data redundancy error mitigation

execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx run tellraw @a[tag=t_debug] [{"type":"text","text":"base/pm_main recovering class data; pm class = "},{"type":"score","score":{"name":"@s","objective":"__cts_selected_class_idx"}},{"type":"text","text":" player class = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"__cts_selected_class_idx"}}]
execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx store result storage cashgrab:pm_recovery_args class_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx
execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx run function cashgrab:base/pm_recover_class with storage cashgrab:pm_recovery_args

execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx run tellraw @a[tag=t_debug] [{"type":"text","text":"base/pm_main recovering trinket data; pm trinket = "},{"type":"score","score":{"name":"@s","objective":"__cts_selected_trinket_idx"}},{"type":"text","text":" player trinket = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"__cts_selected_trinket_idx"}}]
execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx store result storage cashgrab:pm_recovery_args trinket_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx
execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx run function cashgrab:base/pm_recover_trinket with storage cashgrab:pm_recovery_args

# =============================
# Prior-tick functions

# Allow plugins to run code before main pm tick
execute if score ENABLE_PLUGINS num matches 1.. run function #cashgrab:pm_tick_prior

function cashgrab:base/pmt_player_state
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_ability

# =============================
# Main tick - Player activity_state handling

#	activity_state 0	=	Transition to In Pregame Lobby
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=0}] run function cashgrab:base/pmt_tick_transition_to_lobby

#	activity_state 1	=	In Pregame Lobby
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=0}] run function cashgrab:base/pmt_tick_lobby

#	activity_state 10	=	Transition to Class-and-Trinket Select
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=10}] run function cashgrab:base/pmt_tick_transition_to_cts

#	activity_state 11	=	Class-and-Trinket Select (in spawn selection room)
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=11}] run function cashgrab:base/pmt_tick_cts

#	activity_state 20	=	Transition to Gameplay
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=20}] run function cashgrab:base/pmt_tick_transition_to_gameplay

#	activity_state 21	=	Gameplay
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=21}] run function cashgrab:base/pmt_tick_gameplay

# =============================
# Post-tick actions

execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_coins
function cashgrab:base/pmt_scoring
function cashgrab:base/pm_grab

# Allow plugins to run code after main pm tick
execute if score ENABLE_PLUGINS num matches 1.. run function #cashgrab:pm_tick_post

# =============================
# End of pm_main
tag @a[tag=t_pm_owner] remove t_pm_owner

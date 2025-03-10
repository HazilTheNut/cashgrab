# base/pm_main.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Top-level function call for pms to be run every server tick
#
# Arguments: (none)

tag @a remove t_pm_owner

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# =============================
# Player ownership validation

# Increment player __pm_count
scoreboard players add @a[tag=t_pm_owner,limit=1] __pm_count 1

# If a player's pm count is greater than 1, some other pm already processed this player
# 	which means that player is owning multiple pms, which is a problem.
# This case is not expected to occur but this is a failsafe in case it somehow happens.
# Destroying this pm will resolve the issue as the player entity holds all of their data,
#	so pms can be freely be destroyed without worry of corrupting player data
execute if entity @a[tag=t_pm_owner,limit=1,scores={__pm_count=2..}] run tellraw @a[tag=t_pm_owner] "double ownership An error has occurred with your session - reinitializing"
execute if entity @a[tag=t_pm_owner,limit=1,scores={__pm_count=2..}] run scoreboard players set @s eid_owner 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={__pm_count=2..}] run scoreboard players set @a[tag=t_pm_owner,limit=1] reinitialize 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={__pm_count=2..}] run function cashgrab:base/pm_cleanup_if_ownerless
execute if entity @a[tag=t_pm_owner,limit=1,scores={__pm_count=2..}] run return 0

# =============================
# Class and trinket selection data redundancy error mitigation

execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx run tellraw @a[tag=t_debug] [{"type":"text","text":"base/pm_main recovering class data; pm class = "},{"type":"score","score":{"name":"@s","objective":"__cts_selected_class_idx"}},{"type":"text","text":" player class = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"__cts_selected_class_idx"}}]
execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx store result storage cashgrab:pm_recovery_args class_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx
execute unless score @s __cts_selected_class_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx run function cashgrab:base/pm_recover_class with storage cashgrab:pm_recovery_args

execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx run tellraw @a[tag=t_debug] [{"type":"text","text":"base/pm_main recovering trinket data; pm trinket = "},{"type":"score","score":{"name":"@s","objective":"__cts_selected_trinket_idx"}},{"type":"text","text":" player trinket = "},{"type":"score","score":{"name":"@a[tag=t_pm_owner,limit=1]","objective":"__cts_selected_trinket_idx"}}]
execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx store result storage cashgrab:pm_recovery_args trinket_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx
execute unless score @s __cts_selected_trinket_idx = @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx run function cashgrab:base/pm_recover_trinket with storage cashgrab:pm_recovery_args

# =============================
# Handle player respawns

# A player that died the previous server tick will be tagged with t_died

# === Detect if player has respawned
execute if score DEVELOPER_MODE num matches 0 run tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..,activity_state=0..9}] add dtm_send_to_lobby
execute if score DEVELOPER_MODE num matches 0 run tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..,activity_state=10..29}] add dtm_send_to_cts
execute if score DEVELOPER_MODE num matches 0 run tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..,activity_state=30..39}] add dtm_send_to_tutorial
tag @a[tag=t_pm_owner,limit=1,tag=t_died,scores={stat_alive_ticks=1..}] remove t_died

# =============================
# Prior-tick functions

# Allow plugins to run code before main pm tick
function #cashgrab:pmt_tick_prior

function cashgrab:base/pmt_player_state

# =============================
# Main tick - Player activity_state handling

#	activity_state 0	=	Transition to In Pregame Lobby
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=0}] run function cashgrab:base/pmt_tick_transition_to_lobby

#	activity_state 1	=	In Pregame Lobby
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=1}] run function cashgrab:base/pmt_tick_lobby

#	activity_state 10	=	Transition to Class-and-Trinket Select
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=10}] run function cashgrab:base/pmt_tick_transition_to_cts

#	activity_state 11	=	Class-and-Trinket Select (in spawn selection room)
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=11}] run function cashgrab:base/pmt_tick_cts

#	activity_state 20	=	Transition to Gameplay
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=20}] run function cashgrab:base/pmt_tick_transition_to_gameplay

#	activity_state 21	=	Gameplay
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=21}] run function cashgrab:base/pmt_tick_gameplay

#	activity_state 30	=	Transition to Tutorial
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=30}] run function cashgrab:base/pmt_tick_transition_to_tutorial

#	activity_state 31	=	Tutorial
execute if entity @a[tag=t_pm_owner,limit=1,scores={activity_state=31}] run function cashgrab:base/pmt_tick_tutorial

# =============================
# Post-tick actions

function cashgrab:base/pm_grab

# Allow plugins to run code after main pm tick
function #cashgrab:pmt_tick_post

# =============================
# End of pm_main
tag @a[tag=t_pm_owner] remove t_pm_owner

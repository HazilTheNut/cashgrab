# base/pm_main.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Top-level function call for pms to be run every server tick
#
# Arguments: (none)

# Find owner and tag them with t_pm_owner
execute store result storage coinwars:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function coinwars:util/find_eid_self with storage coinwars:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# =============================
# Player ownership validation

# Increment player pm_count
scoreboard players add @a[tag=t_pm_owner] pm_count 1

# If a player's pm count is greater than 1, some other pm already processed this player
# 	which means that player is owning multiple pms, which is a problem.
# This case is not expected to occur but this is a failsafe in case it somehow happens.
# Destroying this pm will resolve the issue as the player entity holds all of their data,
#	so pms can be freely be destroyed without worry of corrupting player data
execute if entity @a[tag=t_pm_owner,scores={pm_count=2..}] run scoreboard players set @s eid_owner 0
execute if entity @a[tag=t_pm_owner,scores={pm_count=2..}] run function coinwars:base/pm_cleanup_if_ownerless
execute if entity @a[tag=t_pm_owner,scores={pm_count=2..}] run return 0

# =============================
# Handle player deaths

# === Detect if player has died
execute if score @a[tag=t_pm_owner,limit=1] __iev_death matches 1.. run function coinwars:base/pm_cleanup_player_subs
#execute if entity @a[tag=t_pm_owner,scores={__iev_death=1..,activity_state=20}] run function coinwars:base/pm_create_coinshower
# Set dead player activity_state to Transition to Class Select
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run scoreboard players set @a[tag=t_pm_owner,scores={__iev_death=1..}] activity_state 1
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run scoreboard players set @a[tag=t_pm_owner,scores={__iev_death=1..}] activity_state 11
# Tag dead player to handle when they respawn
tag @a[tag=t_pm_owner,scores={__iev_death=1..}] add t_died
# Miscellaneous operations on dead player
execute if score DEVELOPER_MODE num matches 0 run spawnpoint @a[tag=t_pm_owner,scores={__iev_death=1..}] 0 100 0

# === Detect if player has respawned
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run tag @a[tag=t_pm_owner,tag=t_died,scores={stat_alive_ticks=1..}] add dtm_send_to_lobby
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run tag @a[tag=t_pm_owner,tag=t_died,scores={stat_alive_ticks=1..}] add dtm_send_to_spawn_select
tag @a[tag=t_pm_owner,tag=t_died,scores={stat_alive_ticks=1..}] remove t_died

# =============================
# Collect player data

#function coinwars:base/gt_player_state

# =============================
# Player activity_state handling

#	activity_state 1	=	Transition to In Pregame Lobby
#clear @a
scoreboard players set @a[tag=t_pm_owner,scores={activity_state=1}] activity_state 0

#	activity_state 0	=	In Pregame Lobby

#	activity_state 11	=	Transition to Class Select
#clear @a
scoreboard players set @a[tag=t_pm_owner,scores={activity_state=11}] activity_state 10

#	activity_state 10	=	Class Select (in spawn selection room)

#	activity_state 21	=	Transition to Gameplay
#execute as @a at @s run function coinwars:classes/pe_equip_perclass
scoreboard players set @a[tag=t_pm_owner,scores={activity_state=21}] activity_state 20

#	activity_state 20	=	Gameplay
#execute as @a at @s run function coinwars:classes/pe_loop_perclass

# =============================
# activity_state irrespective operations

#function coinwars:base/gt_ability
#function coinwars:base/gt_coins
#function coinwars:base/gt_scoring

# =============================
# End of pm_main
tag @a[tag=t_pm_owner] remove t_pm_owner

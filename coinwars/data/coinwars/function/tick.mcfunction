# tick.mcfunction
#
# Structures order of execution of each tick for the coinwars datapack
#
# Arguments: (none)

scoreboard players set DEVELOPER_MODE num 1

scoreboard players set @a[scores={eid_state=1},gamemode=!spectator] eid_state 2
scoreboard players set @a[scores={eid_state=2},gamemode=spectator] eid_state 1

# =============================
# Player eid and pm management

# pms query if their owner still exists and clean up if not
execute as @e[tag=t_pm] run function coinwars:base/pm_cleanup_if_ownerless

# If a pm has been cleaned up, a player likely left the server and their subordinates (who are now ownerless) should be cleaned up
#execute if entity @e[tag=t_pm,tag=t_pm_no_owner] run tellraw @a[tag=t_debug] "pm cleanup"
execute if entity @e[tag=t_pm,tag=t_pm_no_owner] as @e[type=!minecraft:player,scores={eid_state=1..}] run function coinwars:base/npe_cleanup_if_ownerless

# Cleaned up pms should now be killed
tag @e[tag=t_pm_no_owner] remove t_pm
kill @e[tag=t_pm_no_owner]

# At this point, it is guaranteed that no pm exists without an owner.
# Initialize players so that all players own a pm
function coinwars:base/gt_playerinit

# =============================
# Run pm-specific code

# Reset pm_count of all players
scoreboard players set @a pm_count 0

# Run pm_main for all pms
execute as @e[type=minecraft:marker,tag=t_pm,tag=!t_pm_no_owner,scores={eid_state=1}] run function coinwars:base/pm_main

# If a player still has a pm_count of 0, no pm ran for that player. Reinitialize them
scoreboard players set @a[scores={pm_count=0}] reinitialize 1

# =============================
# Operate non-pm non-player entities such as timers, missiles, etc.

# All dropped item entities are destroyed except for those that are tagged as "t_pickup"
kill @e[type=minecraft:item,tag=!t_pickup]

#function coinwars:base/gt_stasis
#function coinwars:base/gt_missile
execute as @e[tag=t_timer] at @s run function coinwars:base/pe_timer_operate with entity @s data
execute as @e[tag=t_coinshower] at @s run function coinwars:base/pe_coinshower

#function coinwars:base/gt_player_count
#execute if score DEVELOPER_MODE num matches 0 run function coinwars:base/gt_lobby
#function coinwars:base/gt_player_state

kill @e[type=minecraft:experience_bottle]
execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s run particle minecraft:block{block_state:"minecraft:birch_planks"} ^ ^ ^-0.2 0.1 0.1 0.1 1 5
kill @e[type=minecraft:arrow,nbt={inGround:1b}]

# Clear all events
scoreboard players set @a ev_jump 0
scoreboard players set @a ev_dmg_absorbed 0
scoreboard players set @a ev_dmg_dealt 0
scoreboard players set @a ev_dmg_taken 0
scoreboard players set @a ev_maps 0
scoreboard players set @a ev_xpbottles 0
scoreboard players set @a ev_snowballs 0
scoreboard players set @a ev_eggs 0
scoreboard players set @a ev_crossbows 0
scoreboard players set @a ev_gold_axe_break 0

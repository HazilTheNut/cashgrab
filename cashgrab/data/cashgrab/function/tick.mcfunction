# tick.mcfunction
#
# Structures order of execution of each tick for the cashgrab datapack
#
# Arguments: (none)

scoreboard players set DEVELOPER_MODE num 1

scoreboard players set @a[scores={eid_state=1},gamemode=!spectator] eid_state 2
scoreboard players set @a[scores={eid_state=2},gamemode=spectator] eid_state 1

# =============================
# Player eid and pm management

# pms query if their owner still exists and clean up if not
execute as @e[tag=t_pm] run function cashgrab:base/pm_cleanup_if_ownerless

# If a pm has been cleaned up, a player likely left the server and their subordinates (who are now ownerless) should be cleaned up
#execute if entity @e[tag=t_pm,tag=t_pm_no_owner] run tellraw @a[tag=t_debug] "pm cleanup"
execute if entity @e[tag=t_pm,tag=t_pm_no_owner] as @e[type=!minecraft:player,scores={eid_state=1..}] run function cashgrab:base/npe_cleanup_if_ownerless
execute if entity @e[tag=t_pm,tag=t_pm_no_owner] run scoreboard players set NUM_PLAYERCOUNT_CHANGED num 1

# Cleaned up pms should now be killed
tag @e[tag=t_pm_no_owner] remove t_pm
kill @e[tag=t_pm_no_owner]

# At this point, it is guaranteed that no pm exists without an owner.
# Initialize players so that all players own a pm
function cashgrab:base/gt_playerinit

# =============================
# Misc. functions ran prior to pms

# Set up coin score display
execute if score DEVELOPER_MODE num matches 0 if score NUM_PLAYERCOUNT_CHANGED num matches 1.. if score NUM_GAMESTATE num matches 1..2 run function cashgrab:base/gt_display_coin_score

# Show goal coin amount
scoreboard players operation GOAL __coins_score = GOAL coins

# In a team game, reset team coin total; pms will add to team total
execute if score NUM_GAMESTATE num matches 2 run scoreboard players set RED_TEAM coins 0
execute if score NUM_GAMESTATE num matches 2 run scoreboard players set BLUE_TEAM coins 0

# =============================
# Run pm-specific code

# Reset pm_count of all players
scoreboard players set @a pm_count 0

# Run pm_main for all pms
execute as @e[type=minecraft:marker,tag=t_pm,tag=!t_pm_no_owner,scores={eid_state=1}] run function cashgrab:base/pm_main

# If a player still has a pm_count of 0, no pm ran for that player. Reinitialize them
tellraw @a[scores={pm_count=0}] "An error has occurred with your session - reinitializing"
scoreboard players set @a[scores={pm_count=0}] reinitialize 1

# =============================
# Operate non-pm non-player entities such as timers, missiles, etc.

# All dropped item entities are destroyed except for those that are tagged as "t_pickup"
kill @e[type=minecraft:item,tag=!t_pickup]

function cashgrab:base/gt_stasis
function cashgrab:base/gt_coins
execute as @e[type=minecraft:marker,tag=t_missile] at @s facing ^ ^ ^1 run function cashgrab:base/missile_main with entity @s data
execute as @e[type=minecraft:marker,tag=t_timer] at @s run function cashgrab:base/timer_main with entity @s data
execute as @e[type=minecraft:marker,tag=t_coinshower] at @s run function cashgrab:base/npe_coinshower

kill @e[type=minecraft:experience_bottle]
execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s run particle minecraft:block{block_state:"minecraft:birch_planks"} ^ ^ ^-0.2 0.1 0.1 0.1 1 5
kill @e[type=minecraft:arrow,nbt={inGround:1b}]

# =============================
# Team game completion detection
execute if score NUM_GAMESTATE num matches 2 run scoreboard players operation RED_TEAM __coins_score = RED_TEAM coins
execute if score NUM_GAMESTATE num matches 2 run scoreboard players operation BLUE_TEAM __coins_score = BLUE_TEAM coins
execute if score NUM_GAMESTATE num matches 2 if score RED_TEAM coins >= GOAL coins run tellraw @a [{"type":"text","color":"red","text":"Red Team"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 2 if score BLUE_TEAM coins >= GOAL coins run tellraw @a [{"type":"text","color":"blue","text":"Blue Team"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 2 if score RED_TEAM coins >= GOAL coins run function cashgrab:end_game
execute if score NUM_GAMESTATE num matches 2 if score BLUE_TEAM coins >= GOAL coins run function cashgrab:end_game

# =============================
# Clear all events
scoreboard players set NUM_PLAYERCOUNT_CHANGED num 0

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

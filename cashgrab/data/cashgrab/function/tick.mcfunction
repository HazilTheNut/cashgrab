# tick.mcfunction
#
# Structures order of execution of each tick for the cashgrab datapack
#
# Arguments: (none)

function cashgrab:runtime_config

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
execute if score DEVELOPER_MODE num matches 0 if score NUM_PLAYERCOUNT_CHANGED num matches 1.. if score NUM_GAMESTATE num matches 1.. run function cashgrab:base/gt_display_coin_score
execute if score DEVELOPER_MODE num matches 0 if score NUM_PLAYERCOUNT_CHANGED num matches 1.. if score NUM_GAMESTATE num matches 1.. run function cashgrab:base/gt_display_coin_score

# Show goal coin amount
scoreboard players operation GOAL __coins_score = GOAL coins

# Allow plugins to run code before pms do
execute if score ENABLE_PLUGINS num matches 1.. run function #cashgrab:gt_tick_prior

# =============================
# Run pm-specific code

# Reset pm_count of all players
scoreboard players set @a pm_count 0
# If the previous server tick ran out of time, a player might still have the t_pm_owner tag
tag @a remove t_pm_owner

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

kill @e[type=minecraft:egg]
kill @e[type=minecraft:experience_bottle]
execute as @e[type=minecraft:arrow,tag=!t_stasis,nbt={inGround:1b}] at @s run function cashgrab:base/arrow_cleanup

# =============================
# Grab mechanics

execute as @e[type=!minecraft:player,scores={eid_state=2}] run function cashgrab:base/npe_grab

# =============================
# Allow plugins to run code at the end of server tick but before events are cleared
execute if score ENABLE_PLUGINS num matches 1.. run function #cashgrab:gt_tick_post

# =============================
# Clear all listenable events
scoreboard players set NUM_PLAYERCOUNT_CHANGED num 0

scoreboard players set @a evl_death 0
scoreboard players set @a evl_player_kills 0
scoreboard players set @a evl_jump 0
scoreboard players set @a evl_dmg_absorbed 0
scoreboard players set @a evl_dmg_dealt 0
scoreboard players set @a evl_dmg_taken 0
scoreboard players set @a evl_coin_pickup 0
scoreboard players set @a evl_crossbows 0

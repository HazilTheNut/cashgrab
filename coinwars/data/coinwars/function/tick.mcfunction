# tick.mcfunction
#
# Structures order of execution of each tick for the coinwars datapack
#
# Arguments: (none)

scoreboard players set DEVELOPER_MODE num 1

scoreboard players set @a[scores={eid_state=1},gamemode=!spectator] eid_state 2
scoreboard players set @a[scores={eid_state=2},gamemode=spectator] eid_state 1

function coinwars:base/gt_playerinit
#function coinwars:base/gt_player_count
#execute if score DEVELOPER_MODE num matches 0 run function coinwars:base/gt_lobby
#function coinwars:base/gt_player_state
#function coinwars:base/gt_ability
#function coinwars:base/gt_stasis
#function coinwars:base/gt_missile
#function coinwars:base/gt_coins
#function coinwars:base/gt_scoring
execute as @e[tag=t_timer] at @s run function coinwars:base/pe_timer_operate with entity @s data
execute as @e[tag=t_coinshower] at @s run function coinwars:base/pe_coinshower

#execute as @a at @s run function coinwars:classes/pe_loop_perclass

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

# tick.mcfunction
#
# Structures order of execution of each tick for the coinwars datapack
#
# Arguments: (none)

scoreboard players set @a[scores={eid_state=1},gamemode=!spectator] eid_state 2
scoreboard players set @a[scores={eid_state=2},gamemode=spectator] eid_state 1

function coinwars:base/gt_player_count
function coinwars:base/gt_lobby
function coinwars:base/gt_player_state
function coinwars:base/gt_ability
function coinwars:base/gt_missile
function coinwars:base/gt_coins
function coinwars:base/gt_scoring
execute as @e[tag=t_timer] at @s run function coinwars:base/pe_timer_operate with entity @s data
execute as @e[tag=t_coinshower] at @s run function coinwars:base/pe_coinshower

execute as @a at @s run function coinwars:classes/pe_loop_perclass

kill @e[type=minecraft:experience_bottle]
kill @e[type=minecraft:arrow,nbt={inGround:1b}]

execute as @e[tag=t_generic_has_func_step,type=!minecraft:marker] at @s run function coinwars:base/pe_run_func_step with entity @s Passengers[0].data
execute as @e[tag=t_generic_has_func_step,type=minecraft:marker] at @s run function coinwars:base/pe_run_func_step with entity @s data

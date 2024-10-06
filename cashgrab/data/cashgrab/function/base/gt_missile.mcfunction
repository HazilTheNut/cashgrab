# base/gt_missile.mcfunction
#
# Context: Global level
#
# Summary: Operates all missiles
#
# Arguments: (none)

execute as @e[type=minecraft:marker,tag=t_missile] at @s facing ^ ^ ^1 run function cashgrab:base/pe_missile with entity @s data
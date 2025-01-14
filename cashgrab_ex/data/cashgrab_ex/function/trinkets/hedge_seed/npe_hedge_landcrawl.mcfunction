# trinkets/hedge_seed/npe_hedge_landcrawl.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Places a Hedge timer at execution location then recursively crawls forward one step
#
# Arguments: (none)

# Decrement step count and terminate at 0
scoreboard players remove @s tv_A 1
execute if score @s tv_A matches ..0 run return 0

# Calculate y offset based on terrain ahead
scoreboard players set @s temp_A 0
execute if score @s temp_A matches 0 store result score @s temp_A run execute positioned ^ ^ ^1 if block ~ ~1 ~ minecraft:air unless block ~ ~ ~ minecraft:air run scoreboard players get NUM_THREE num
execute if score @s temp_A matches 0 store result score @s temp_A run execute positioned ^ ^ ^1 if block ~ ~ ~ minecraft:air unless block ~ ~-1 ~ minecraft:air run scoreboard players get NUM_TWO num
execute if score @s temp_A matches 0 store result score @s temp_A run execute positioned ^ ^ ^1 if block ~ ~-1 ~ minecraft:air unless block ~ ~-2 ~ minecraft:air run scoreboard players get NUM_ONE num

execute if score @s temp_A matches 1 run data merge storage cashgrab_ex:hedge_args {data:{y_offset:-1}}
execute if score @s temp_A matches 2 run data merge storage cashgrab_ex:hedge_args {data:{y_offset:0}}
execute if score @s temp_A matches 3 run data merge storage cashgrab_ex:hedge_args {data:{y_offset:1}}

# Run terrain collision detection to prevent hedges from passing through exposed corners
scoreboard players set @s temp_B 0
execute if score @s temp_A matches 1..2 store result score @s temp_B run function cashgrab:util/npe_col_detect_terrain with storage cashgrab_ex:hedge_args data
execute if score @s temp_A matches 3 positioned ~ ~1 ~ store result score @s temp_B run function cashgrab:util/npe_col_detect_terrain with storage cashgrab_ex:hedge_args data
execute if score @s temp_B matches 1 run return 0

# Crawl forwards
execute if score @s temp_A matches 1.. positioned ^ ^ ^1 run function cashgrab_ex:trinkets/hedge_seed/npe_hedge_landcrawl_recursion with storage cashgrab_ex:hedge_args data


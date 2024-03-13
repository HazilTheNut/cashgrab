
#particle smoke ~ ~ ~ 0 0 0 0 1

scoreboard players set @s cv_B 0

execute if block ~1 ~ ~ minecraft:air run scoreboard players add @s cv_B 1
execute if block ~ ~1 ~ minecraft:air run scoreboard players add @s cv_B 1
execute if block ~ ~ ~1 minecraft:air run scoreboard players add @s cv_B 1
execute if block ~-1 ~ ~ minecraft:air run scoreboard players add @s cv_B 1
execute if block ~ ~-1 ~ minecraft:air run scoreboard players add @s cv_B 1
execute if block ~ ~ ~-1 minecraft:air run scoreboard players add @s cv_B 1

# If too much air nearby
execute if entity @s[scores={cv_B=5..}] run setblock ~ ~ ~ minecraft:air

# If not enough air nearby
execute if entity @s[scores={cv_B=..2}] if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:white_concrete

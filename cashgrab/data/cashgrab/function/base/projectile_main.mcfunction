# base/projectile_main.mcfunction
#
# Context:
#	as: a #cashgrab:projectile entity
#	at: the entity
#
# Summary: Main loop for projectiles
#
# Arguments: (none)

# Do not affect items in any way, they are handled elsewhere
execute if entity @s[type=minecraft:item] run return 0

scoreboard players add @s __projectile_idx 0
execute if score @s __projectile_idx matches 0 run scoreboard players add @e[type=#cashgrab:projectile,scores={__projectile_idx=1..}] __projectile_idx 1
execute if score @s __projectile_idx matches 0 run scoreboard players add @s __projectile_idx 1

execute unless score @s __projectile_idx > NUM_MAX_PROJECTILES num run return 0
scoreboard players reset @s
kill @s

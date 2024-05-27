# classes/griefer/creeper_func_step.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: the entity
#
# Summary: Loop function for Griefer creeper
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

execute if entity @s[tag=t_cleanup] run tp @s ~ ~-100 ~
execute if entity @s[tag=t_cleanup] run scoreboard players reset @s
execute if entity @s[tag=t_cleanup] run kill @s
execute if entity @s[tag=t_cleanup] run return 0

scoreboard players remove @s cv_H 1

execute if score @s cv_H matches ..0 run tag @s add t_explode

execute if entity @s[tag=t_explode] run particle minecraft:explosion ~ ~0.65 ~ 2.5 0.2 2.5 0 20 force
execute if entity @s[tag=t_explode] run particle minecraft:lava ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_explode] run particle minecraft:flame ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_explode] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.75

execute if entity @s[tag=t_explode] run function coinwars:util/pe_col_entity_filter_hostile
execute if entity @s[tag=t_explode] run function coinwars:util/pe_eid_find_owner
execute if entity @s[tag=t_explode] run tag @e[scores={eid_compare=0}] add t_dmg_src
execute if entity @s[tag=t_explode] run tag @e[scores={eid_compare=0}] add t_collision_candidate
execute if entity @s[tag=t_explode] as @e[tag=t_collision_candidate,distance=..4.5] run damage @s 8.0 minecraft:fireball by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_explode,limit=1,sort=nearest]
execute if entity @s[tag=t_explode] run tag @e[scores={eid_compare=0}] remove t_dmg_src

execute if entity @s[tag=t_explode] run scoreboard players reset @s
execute if entity @s[tag=t_explode] run kill @s
tag @s[tag=t_explode] remove t_explode

# classes/griefer/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: the entity
#
# Summary: Loop function for Griefer class
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

scoreboard players remove @s[scores={cv_B=0..}] cv_B 1
effect clear @s[scores={cv_B=0}] minecraft:levitation

# Crash Landing flight particles
execute if entity @s[scores={cv_A=1}] run particle minecraft:flame ~ ~0.35 ~ 0.1 0.2 0.1 0 2

# Crash Landing Landing
tag @s[scores={ps_falling=-1,cv_A=1..,cv_B=..0}] add t_crash_landing_explode
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:explosion ~ ~0.65 ~ 2.5 0.2 2.5 0 20 force
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:lava ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:flame ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_crash_landing_explode] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.75

execute if entity @s[tag=t_crash_landing_explode] run function coinwars:util/pe_col_filter_entity_hostile
execute if entity @s[tag=t_crash_landing_explode] run tag @s add t_dmg_src
execute if entity @s[tag=t_crash_landing_explode] as @e[tag=t_collision_candidate,distance=..4.5] run damage @s 6.0 minecraft:explosion by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_dmg_src,limit=1,sort=nearest]

scoreboard players set @s[tag=t_crash_landing_explode] cv_A 0
tag @s remove t_dmg_src
tag @s remove t_crash_landing_explode

# Creeper in a Bottle
execute if score @s ev_xpbottles matches 1.. run function coinwars:util/pe_raycast {\
i_range_m:3,\
i_origin_loc:0,\
col_terrain_allowed:"#coinwars:nonsolid",\
b_fit_player:1,\
func_entity_filter:"coinwars:util/dummy",\
func_step:"coinwars:util/dummy",\
func_end:"coinwars:classes/griefer/summon_creeper",\
}
execute if score @s ev_xpbottles matches 1.. run scoreboard players set @s cv_C 160
execute if score @s ev_xpbottles matches 1.. run function coinwars:classes/griefer/creeper_ability_icon
scoreboard players set @s ev_xpbottles 0

# Creeper in a Bottle cooldown
scoreboard players remove @s[scores={cv_C=0..}] cv_C 1
execute if score @s cv_C matches 0 run function coinwars:classes/griefer/creeper_ability_icon


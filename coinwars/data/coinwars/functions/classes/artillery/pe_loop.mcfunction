# classes/artillery/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 5
#	at: the entity
#
# Summary: Loop function for Artillery class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Rocket Barrage missiles sequence
execute if score @s cv_A matches 12 run tag @s add t_artillery_missile_rh
execute if score @s cv_A matches 9 run tag @s add t_artillery_missile_lh
execute if score @s cv_A matches 6 run tag @s add t_artillery_missile_rh
execute if score @s cv_A matches 3 run tag @s add t_artillery_missile_lh
scoreboard players remove @s[scores={cv_A=0..}] cv_A 1

# Fire missile (right-handed)
execute if entity @s[tag=t_artillery_missile_rh] run function coinwars:util/pe_create_missile { \
f_speed_mpt:0.7f,\
i_lifetime_ticks:100,\
i_range_m:50,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_artillery_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:util/dummy",\
func_step:"coinwars:classes/artillery/missile_step",\
func_end:"coinwars:classes/artillery/missile_end"\
}
execute if entity @s[tag=t_artillery_missile_rh] run playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1.0 1.25

# Fire missile (left-handed)
execute if entity @s[tag=t_artillery_missile_lh] run function coinwars:util/pe_create_missile { \
f_speed_mpt:0.7f,\
i_lifetime_ticks:100,\
i_range_m:50,\
i_origin_loc:2,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_artillery_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:util/dummy",\
func_step:"coinwars:classes/artillery/missile_step",\
func_end:"coinwars:classes/artillery/missile_end"\
}
execute if entity @s[tag=t_artillery_missile_lh] run playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1.0 1.25

tag @s remove t_artillery_missile_rh
tag @s remove t_artillery_missile_lh
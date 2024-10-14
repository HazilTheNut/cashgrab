# classes/artillery/pmtl_artillery_loop.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
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
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 12 run tag @a[tag=t_pm_owner,limit=1] add t_artillery_missile_rh
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 9 run tag @a[tag=t_pm_owner,limit=1] add t_artillery_missile_lh
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 6 run tag @a[tag=t_pm_owner,limit=1] add t_artillery_missile_rh
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run tag @a[tag=t_pm_owner,limit=1] add t_artillery_missile_lh
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=0..}] cv_A 1

execute if entity @a[tag=t_pm_owner,limit=1,tag=!t_artillery_missile_lh,tag=!t_artillery_missile_rh] run return 0

# Fire missile (right-handed)
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_artillery_missile_rh] run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:100,\
i_range_m:50,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_artillery_missile_init",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_tracking_filter:"cashgrab:util/dummy",\
func_start:"cashgrab:util/dummy",\
func_step:"cashgrab:classes/artillery/missile_step",\
func_end:"cashgrab:classes/artillery/missile_end",\
b_assign_as_peer:1,\
}
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_artillery_missile_rh] run playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1.0 1.25

# Fire missile (left-handed)
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_artillery_missile_lh] run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:100,\
i_range_m:50,\
i_origin_loc:2,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_artillery_missile_init",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_tracking_filter:"cashgrab:util/dummy",\
func_start:"cashgrab:util/dummy",\
func_step:"cashgrab:classes/artillery/missile_step",\
func_end:"cashgrab:classes/artillery/missile_end",\
b_assign_as_peer:1,\
}
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_artillery_missile_lh] run playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1.0 1.25

# End missile initialization
tag @n[tag=t_artillery_missile_init] add t_artillery_missile
tag @n[tag=t_artillery_missile_init] remove t_artillery_missile_init

tag @a[tag=t_pm_owner,limit=1] remove t_artillery_missile_rh
tag @a[tag=t_pm_owner,limit=1] remove t_artillery_missile_lh

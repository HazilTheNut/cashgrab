# classes/frostknight/pmtl_frostknight_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0

playsound minecraft:entity.breeze.shoot player @a ~ ~ ~ 1.0 1.5

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.8f,\
i_lifetime_ticks:60,\
i_origin_loc:1,\
f_focal_dist_m:10,\
i_gravity_vy_mmpt:250,\
i_gravity_const_mmpt2:100,\
f_tracking_scalar:0,\
t_missile_name:"t_frostknight_glacier_missile",\
col_terrain_allowed:"minecraft:air",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/frostknight/glacier_missile_tick",\
func_npe_end:"cashgrab:classes/frostknight/glacier_missile_end",\
b_assign_as_peer:1,\
}

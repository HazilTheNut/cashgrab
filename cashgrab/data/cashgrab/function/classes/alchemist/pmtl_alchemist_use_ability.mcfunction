# classes/alchemist/pe_use_ability.mcfunction
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
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 1.5

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:200,\
i_origin_loc:1,\
f_focal_dist_m:10,\
i_gravity_vy_mmpt:75,\
i_gravity_const_mmpt2:20,\
f_tracking_scalar:0,\
t_missile_name:"t_alchemist_flametrap_missile",\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/alchemist/flametrap_missile_tick",\
func_npe_end:"cashgrab:classes/alchemist/flametrap_missile_end",\
b_assign_as_peer:1,\
}

# classes/evincer/pmtl_evincer_cast_cerulean_sphere.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Casts Cerulean Sphere
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.40f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_evincer_cerulean_sphere_missile",\
f_tracking_scalar:0.70f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/evincer/cerulean_sphere_missile_tick",\
func_npe_end:"cashgrab_ex:classes/evincer/cerulean_sphere_missile_end",\
b_assign_as_peer:1,\
}

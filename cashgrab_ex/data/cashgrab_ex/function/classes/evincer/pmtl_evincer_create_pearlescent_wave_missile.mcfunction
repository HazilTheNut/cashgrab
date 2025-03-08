# classes/evincer/pmtl_evincer_create_pearlescent_wave_missile.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Creates a Pearlescent Wave missile
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
f_speed_mpt:0.65f,\
i_lifetime_ticks:16,\
i_origin_loc:0,\
f_focal_dist_m:100,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_evincer_pearlescent_wave_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/evincer/pearlescent_wave_missile_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# trinkets/flame_trap/pmtl_flame_trap_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Runs when trinket is used
#
# Arguments: (none)

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:200,\
i_origin_loc:1,\
f_focal_dist_m:10,\
i_gravity_vy_mmpt:75,\
i_gravity_const_mmpt2:20,\
f_tracking_scalar:0,\
t_missile_name:"t_flametrap_missile",\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/flame_trap/npe_flametrap_missile_tick",\
func_npe_end:"cashgrab_ex:trinkets/flame_trap/npe_flametrap_missile_end",\
b_assign_as_peer:1,\
}

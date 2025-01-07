# classes/dancer/pmtl_dancer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#   + the owner of the pm is tagged with t_dancer_sforz_missile
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Dancer class
#
# Arguments:
#   pitch: The offset value assigned to pitch (in degrees)
#   yaw: The offset value assigned to yaw (in degrees)

$execute positioned ~ ~1.625 ~ rotated ~$(pitch) ~$(yaw) run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:40,\
i_origin_loc:0,\
f_focal_dist_m:0,\
i_gravity_vy_mmpt:100,\
i_gravity_const_mmpt2:125,\
t_missile_name:"t_dancer_sforz_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:classes/dancer/dancer_missile_tick",\
func_npe_end:"cg_maks:classes/dancer/dancer_missile_end",\
b_assign_as_peer:1,\
}
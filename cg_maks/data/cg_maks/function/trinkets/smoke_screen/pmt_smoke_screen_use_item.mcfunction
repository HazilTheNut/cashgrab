# trinkets/smoke_screen/pmt_smoke_screen_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Executes the behavior of Smoke Screen when used
#
# Arguments: (none)

execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:35,\
i_gravity_vy_mmpt:75,\
i_gravity_const_mmpt2:20,\
t_missile_name:"t_smoke_screen_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:trinkets/smoke_screen/npe_smoke_screen_missile_tick",\
func_npe_end:"cg_maks:trinkets/smoke_screen/npe_smoke_screen_missile_end",\
b_assign_as_peer:1,\
}
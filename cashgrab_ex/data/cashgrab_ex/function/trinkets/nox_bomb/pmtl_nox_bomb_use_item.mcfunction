# trinkets/nox_bomb/pmtl_nox_bomb_use_item.mcfunction
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

playsound minecraft:block.glass.break player @a ~ ~ ~ 1.0 2.0

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.6f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:350,\
i_gravity_const_mmpt2:40,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_end",\
b_assign_as_peer:1,\
}

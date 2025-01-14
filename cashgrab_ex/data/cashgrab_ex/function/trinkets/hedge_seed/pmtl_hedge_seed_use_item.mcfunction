# trinkets/hedge_seed/pmtl_hedge_seed_use_item.mcfunction
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

# Throw seed missile
function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.65f,\
i_lifetime_ticks:60,\
i_origin_loc:1,\
f_focal_dist_m:35,\
i_gravity_vy_mmpt:300,\
i_gravity_const_mmpt2:60,\
t_missile_name:"t_hedge_seed_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"minecraft:air",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_missile_tick",\
func_npe_end:"cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_missile_end",\
b_assign_as_peer:1,\
}

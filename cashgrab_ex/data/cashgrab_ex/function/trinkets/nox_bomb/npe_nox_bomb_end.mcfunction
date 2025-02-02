# trinkets/nox_bomb/npe_nox_bomb_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Echo Bolt missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$tellraw @a[tag=t_debug] "trinkets/nox_bomb/npe_nox_bomb_end $(end_reason)"

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash

# Spawn secondary wave of missiles

execute positioned ~ ~0.5 ~ rotated ~90 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

execute positioned ~ ~0.5 ~ rotated ~30 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

execute positioned ~ ~0.5 ~ rotated ~150 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

execute positioned ~ ~0.5 ~ rotated ~-30 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

execute positioned ~ ~0.5 ~ rotated ~-90 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

execute positioned ~ ~0.5 ~ rotated ~-150 0 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.275f,\
i_lifetime_ticks:100,\
i_origin_loc:0,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:590,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_nox_bomb_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_tick",\
func_npe_end:"cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash",\
b_assign_as_peer:1,\
}

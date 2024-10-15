
function cashgrab:trinkets/test_item/vsfx_pop

particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0 10

tellraw @a[tag=t_debug] [{"type":"text","text":"test item raycast temp_A: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.075f,\
i_lifetime_ticks:100,\
i_range_m:100,\
i_origin_loc:0,\
i_gravity_vy_mmpt:500,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0,\
t_missile_name:"t_test_missile",\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_tracking_filter:"cashgrab:util/dummy",\
func_start:"cashgrab:util/dummy",\
func_step:"cashgrab:trinkets/test_item/missile_step",\
func_end:"cashgrab:trinkets/test_item/vsfx_pop",\
b_assign_as_peer:1,\
}

execute rotated ~30 ~ run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.075f,\
i_lifetime_ticks:100,\
i_range_m:100,\
i_origin_loc:0,\
i_gravity_vy_mmpt:500,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0,\
t_missile_name:"t_test_missile",\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_tracking_filter:"cashgrab:util/dummy",\
func_start:"cashgrab:util/dummy",\
func_step:"cashgrab:trinkets/test_item/missile_step",\
func_end:"cashgrab:trinkets/test_item/vsfx_pop",\
b_assign_as_peer:1,\
}

execute rotated ~-30 ~ run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.075f,\
i_lifetime_ticks:100,\
i_range_m:100,\
i_origin_loc:0,\
i_gravity_vy_mmpt:500,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0,\
t_missile_name:"t_test_missile",\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_tracking_filter:"cashgrab:util/dummy",\
func_start:"cashgrab:util/dummy",\
func_step:"cashgrab:trinkets/test_item/missile_step",\
func_end:"cashgrab:trinkets/test_item/vsfx_pop",\
b_assign_as_peer:1,\
}

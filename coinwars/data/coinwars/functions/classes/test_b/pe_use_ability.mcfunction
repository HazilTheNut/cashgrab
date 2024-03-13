# classes/test_b/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = -2
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

function coinwars:util/pe_create_missile { \
f_speed_mpt:0.75f,\
i_lifetime_ticks:400,\
i_range_m:50,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_class_b_missile",\
f_tracking_scalar:1.0f,\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/pe_col_filter_entity_hostile",\
func_tracking_filter:"coinwars:util/pe_col_filter_entity_hostile",\
func_start:"coinwars:util/dummy",\
func_step:"coinwars:classes/test_b/missile_step",\
func_end:"coinwars:classes/test_b/missile_end"\
}

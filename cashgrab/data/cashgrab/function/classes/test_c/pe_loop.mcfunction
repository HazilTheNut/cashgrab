# classes/test_c/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = -3
#	at: the entity
#
# Summary: Loop function for TEST_C class
#
# Arguments: (none)

scoreboard players remove @s cv_A 1
execute if entity @s[scores={cv_A=1..}] run function coinwars:util/pe_raycast { \
i_range_m:10,\
i_origin_loc:2,\
col_terrain_allowed:"#coinwars:nonsolid",\
b_fit_player:1,\
func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile",\
func_step:"coinwars:classes/test_c/raycast_step",\
func_end:"coinwars:classes/test_c/raycast_end"\
}

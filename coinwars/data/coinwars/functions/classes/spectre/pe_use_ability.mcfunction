# classes/spectre/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 3
#	at: the entity
#
# Summary: Uses Blink ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40

function coinwars:util/pe_raycast {\
i_range_m:11,\
i_origin_loc:0,\
col_terrain_allowed:"#coinwars:partialsolid",\
b_fit_player:1,\
func_entity_filter:"coinwars:util/dummy",\
func_step:"coinwars:util/dummy",\
func_end:"coinwars:classes/spectre/pe_blink_end",\
}

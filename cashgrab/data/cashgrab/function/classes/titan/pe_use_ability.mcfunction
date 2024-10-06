# classes/frostknight/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 7
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

playsound minecraft:block.portal.travel player @a ~ ~ ~ 0.15 2.0

function coinwars:util/pe_raycast {\
i_range_m:25,\
i_origin_loc:1,\
col_terrain_allowed:"#coinwars:nonsolid",\
b_fit_player:0,\
func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile",\
func_step:"coinwars:classes/titan/pull_raycast_step",\
func_end:"coinwars:classes/titan/pull_raycast_end",\
}

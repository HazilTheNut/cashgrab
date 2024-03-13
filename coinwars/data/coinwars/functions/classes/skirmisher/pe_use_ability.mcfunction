# classes/skirmisher/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 2
#	at: the entity
#
# Summary: Uses Boomerang ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if holding the Dancing Rapier, and 0 otherwise. 
#				Used to track which weapon is equipped to not reset their current positions when inventory refreshes.
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

function coinwars:util/pe_create_missile {\
f_speed_mpt:0.75f,\
i_lifetime_ticks:400,\
i_range_m:15,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0f,\
t_missile_name:"t_boomerang",\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/dummy",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:classes/skirmisher/boomerang_start",\
func_step:"coinwars:classes/skirmisher/boomerang_step",\
func_end:"coinwars:classes/skirmisher/boomerang_end",\
}


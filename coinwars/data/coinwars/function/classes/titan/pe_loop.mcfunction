# classes/titan/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 8
#	at: the entity
#
# Summary: Loop function for Titan class
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

# Power Strike enter cooldown
execute if score @s ev_gold_axe_break matches 1.. run scoreboard players set @s cv_A 140
execute if score @s ev_gold_axe_break matches 1.. run function coinwars:classes/titan/power_strike_icon
execute if score @s ev_gold_axe_break matches 1.. run function coinwars:util/pe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#coinwars:partialsolid",\
b_fit_player:0,\
func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile",\
func_step:"coinwars:util/dummy",\
func_end:"coinwars:classes/titan/power_strike_raycast_end",\
}

# Power Strike cooldown
execute if score @s cv_A matches 0.. run scoreboard players remove @s cv_A 1
execute if score @s cv_A matches 0 run function coinwars:classes/titan/power_strike_icon

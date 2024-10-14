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
execute if score @a[tag=t_pm_owner,limit=1] ev_gold_axe_break matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 140
execute if score @a[tag=t_pm_owner,limit=1] ev_gold_axe_break matches 1.. run function cashgrab:classes/titan/pmt_titan_inv_power_strike
execute if score @a[tag=t_pm_owner,limit=1] ev_gold_axe_break matches 1.. positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:0,\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_step:"cashgrab:util/dummy",\
func_end:"cashgrab:classes/titan/power_strike_raycast_end",\
}

# Power Strike cooldown
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0.. run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 1
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run function cashgrab:classes/titan/pmt_titan_inv_power_strike

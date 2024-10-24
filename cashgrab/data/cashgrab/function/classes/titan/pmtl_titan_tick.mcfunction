# classes/titan/pmtl_titan_tick.mcfunction
#
# Context:
#	as: an entity with class = 8
#	at: the entity
#
# Summary: Tick function for Titan class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Power Strike enter cooldown
execute if score @a[tag=t_pm_owner,limit=1] evc_gold_axe_break matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 7000
execute if score @a[tag=t_pm_owner,limit=1] evc_gold_axe_break matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0
execute if score @a[tag=t_pm_owner,limit=1] evc_gold_axe_break matches 1.. run function cashgrab:classes/titan/pmt_titan_inv_power_strike
execute if score @a[tag=t_pm_owner,limit=1] evc_gold_axe_break matches 1.. positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:classes/titan/npe_col_entity_filter_hostile_hurt",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab:classes/titan/power_strike_raycast_end",\
}

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_gold_axe_break 0

# Power Strike cooldown
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_A -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate

# Award Power Strike
execute unless entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..0,cv_B=0}] run return 0
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1
function cashgrab:classes/titan/pmt_titan_inv_power_strike

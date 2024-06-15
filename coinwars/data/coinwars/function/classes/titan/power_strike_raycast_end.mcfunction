# classes/titan/power_strike_raycast_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Titan's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

execute unless score @s temp_A matches 2 run return 0

#scoreboard players set @s ability_cfg_cooldown_ticks 200

execute as @e[tag=t_collision_found,limit=1,sort=nearest,scores={eid_state=1..}] run function coinwars:util/pe_set_timer {\
lifetime_ticks:200,\
b_anchor_at_pos:0,\
t_timer_name:"t_titan_power_strike_knockback_tmr",\
func_step:"coinwars:classes/titan/power_strike_timer_step",\
func_end:"coinwars:util/dummy",\
}

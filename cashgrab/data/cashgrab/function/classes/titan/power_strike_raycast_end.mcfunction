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
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

$tellraw @a[tag=t_debug] "classes/titan/power_strike_raycast_end: end_reason: $(end_reason)"

execute unless score @s temp_A = NUM_END_REASON_ENTITY_COLLISION num run return 0

# Apply knockback timer for players
tag @a[tag=t_collision_found] add t_titan_set_power_strike_timer
execute as @e[tag=t_pm] at @s run function cashgrab:classes/titan/pm_set_power_strike_timer
tag @a remove t_titan_set_power_strike_timer

# Apply knockback timer for non-player entities
execute as @n[type=!minecraft:player,tag=t_collision_found,scores={eid_state=1..}] at @s run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:200,\
b_anchor_at_pos:0,\
t_timer_name:"t_titan_power_strike_knockback_tmr_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/titan/power_strike_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:0,\
}

# Initialize knockback timer
scoreboard players operation @e[tag=t_titan_power_strike_knockback_tmr_init] cv_D = @s eid_owner
tag @e[tag=t_titan_power_strike_knockback_tmr_init] add t_titan_power_strike_knockback_tmr
tag @e[tag=t_titan_power_strike_knockback_tmr_init] remove t_titan_power_strike_knockback_tmr_init

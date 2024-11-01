# classes/alchemist/flametrap_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's flame trap missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# The Flame Trap's entire arming and activation sequence uses the timer based on particular ranges of tmr_lifetime_ticks:
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		15	= trap trigger sfx and vfx
#	20-60	= trap is armed
#		21	= trap creates a puff of smoke
#	61-120	= trap is arming

$scoreboard players set @s temp_A $(end_reason)
execute unless score @s temp_A matches 1..2 run return 0

execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0 15
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
lifetime_ticks:120,\
b_anchor_at_pos:1,\
t_timer_name:"t_alchemist_flametrap_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/alchemist/flametrap_timer_tick",\
func_npe_end:"cashgrab:classes/alchemist/flametrap_timer_end",\
b_assign_as_peer:1,\
}

scoreboard players set @e[tag=t_alchemist_flametrap_timer_init,limit=1,sort=nearest] cv_D 2400
tag @e[tag=t_alchemist_flametrap_timer_init,limit=1,sort=nearest] add t_alchemist_flametrap_timer
tag @e[tag=t_alchemist_flametrap_timer_init,limit=1,sort=nearest] remove t_alchemist_flametrap_timer_init


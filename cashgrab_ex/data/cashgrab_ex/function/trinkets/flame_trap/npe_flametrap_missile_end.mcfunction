# trinkets/flame_trap/npe_flametrap_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's flame trap missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Trinket variable usage:
#	tv_A	:	Flame Trap expiration timer
#	tv_B	:	
#	tv_C	:	
#	tv_D	:	

# The Flame Trap's entire arming and activation sequence uses the timer based on particular ranges of tmr_lifetime_ticks:
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		15	= trap trigger sfx and vfx
#	20-60	= trap is armed
#		21	= trap creates a puff of smoke
#	61-120	= trap is arming

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

# Check for existing flame traps and clean one up if >= 3
function cashgrab:util/npe_eid_find_peers
execute store result score @s temp_A run execute if entity @e[tag=t_flametrap_timer,scores={eid_compare=0}]
execute if score @s temp_A matches 3.. run tag @e[tag=t_flametrap_timer,scores={eid_compare=0},limit=1,sort=arbitrary] add t_cleanup

# Place new flame trap timer
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0 15
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:1,\
t_timer_name:"t_flametrap_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/flame_trap/npe_flametrap_timer_tick",\
func_npe_end:"cashgrab_ex:trinkets/flame_trap/npe_flametrap_timer_end",\
b_assign_as_peer:1,\
}

scoreboard players set @e[tag=t_flametrap_timer_init,limit=1,sort=nearest] tv_A 2400
tag @e[tag=t_flametrap_timer_init,limit=1,sort=nearest] add t_flametrap_timer
tag @e[tag=t_flametrap_timer_init,limit=1,sort=nearest] remove t_flametrap_timer_init


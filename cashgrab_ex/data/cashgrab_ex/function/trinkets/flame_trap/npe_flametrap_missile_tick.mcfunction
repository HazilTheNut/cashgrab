# trinkets/flame_trap/npe_flametrap_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's flame trap missile tick function
#
# Arguments: (none)

# Trinket variable usage:
#	tv_A	:	Flame Trap expiration timer
#	tv_B	:	
#	tv_C	:	
#	tv_D	:	

particle minecraft:dust{color:[0.8f,0.2f,0.4f],scale:1.0} ~ ~ ~ 0 0 0 0 1 force

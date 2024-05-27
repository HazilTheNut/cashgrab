# classes/titan/pull_missile_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Titan's missile step function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:cloud ~ ~ ~ 0 0 0 0 1

function coinwars:util/pe_eid_find_owner
execute as @e[scores={eid_compare=0}] at @s run particle minecraft:crit ~ ~ ~ 1 1 1 0 10

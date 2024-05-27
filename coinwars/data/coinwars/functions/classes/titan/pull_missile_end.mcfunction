# classes/titan/pull_missile_end.mcfunction
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
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

function coinwars:util/pe_eid_find_owner
attribute @e[scores={eid_compare=0},limit=1] minecraft:generic.gravity base set 0.08


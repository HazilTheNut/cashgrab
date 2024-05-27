# classes/titan/pe_col_entity_filter_hostile_hurt.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Tags all entities considered hostile (other ffa entities or enemy team) to the owner with t_collision_candidate, 
# 			filtering out entities that have not taken damage this server tick.
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

function coinwars:util/pe_col_entity_filter_hostile_hurt
tag @e[scores={ev_dmg_taken=..0}] remove t_collision_candidate

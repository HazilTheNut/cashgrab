# classes/champion/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 6
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Start sequence timer
scoreboard players set @s cv_A 60

# Grant speed bonus to yourself and allies
function coinwars:util/pe_col_entity_filter_allies
effect give @e[tag=t_collision_candidate,distance=..5] minecraft:speed 3 1 true

# Display particles
particle minecraft:effect ~ ~0.4 ~ 2.5 0.1 2.5 0 50

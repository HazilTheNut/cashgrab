# classes/alchemist/translocator_timer_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's Translocator timer end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

particle minecraft:enchanted_hit ~ ~0.8 ~ 0.25 0.5 0.25 0 1

# Timer persists forever
scoreboard players set @s tmr_lifetime_ticks 3

# Apply glowing to nearby hostiles
function cashgrab:util/npe_col_entity_filter_hostile
effect give @e[tag=t_collision_candidate,distance=..5] minecraft:glowing 1

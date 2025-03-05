# classes/alchemist/flametrap_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's Translocator missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

particle minecraft:dust{color:[1.0f,1.0f,0.6f],scale:1.0} ~ ~ ~ 0 0 0 0 1
execute unless score @s stasis_state matches -1..0 run return 0
particle minecraft:block{block_state:"minecraft:yellow_glazed_terracotta"} ~ ~ ~ 0 0 0 0 1

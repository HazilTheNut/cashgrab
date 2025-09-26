# classes/chronomancer/stasis_field_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Chronomancer's Stasis Field tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	state value if player is in a Stasis Field
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Particles
particle minecraft:enchanted_hit ~8 ~8 ~ 0 0 3.25 0 20 force
particle minecraft:enchanted_hit ~-8 ~8 ~ 0 0 3.25 0 20 force
particle minecraft:enchanted_hit ~ ~8 ~8 3.25 0 0 0 20 force
particle minecraft:enchanted_hit ~ ~8 ~-8 3.25 0 0 0 20 force
particle minecraft:enchanted_hit ~8 ~-8 ~ 0 0 3.25 0 20 force
particle minecraft:enchanted_hit ~-8 ~-8 ~ 0 0 3.25 0 20 force
particle minecraft:enchanted_hit ~ ~-8 ~8 3.25 0 0 0 20 force
particle minecraft:enchanted_hit ~ ~-8 ~-8 3.25 0 0 0 20 force
particle minecraft:enchanted_hit ~8 ~ ~8 0 3.25 0 0 20 force
particle minecraft:enchanted_hit ~8 ~ ~-8 0 3.25 0 0 20 force
particle minecraft:enchanted_hit ~-8 ~ ~-8 0 3.25 0 0 20 force
particle minecraft:enchanted_hit ~-8 ~ ~8 0 3.25 0 0 20 force
particle minecraft:enchant ~ ~ ~ 3.25 3.25 3.25 1 7 force

#particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 4 force

# Apply stasis to everything inside
execute positioned ~-8.5 ~-8.5 ~-8.5 run tag @e[dx=16,dy=16,dz=16] add t_stasis

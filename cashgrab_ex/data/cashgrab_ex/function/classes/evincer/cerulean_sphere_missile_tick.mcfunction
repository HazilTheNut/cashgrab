# classes/evincer/cerulean_sphere_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Evincer's Cerulean Sphere missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

particle minecraft:dust{color:[0.00,0.70,1.00],scale:3.0} ~ ~ ~ 0 0 0 0 1 force
particle minecraft:splash ~ ~ ~ 0.1 0.1 0.1 0 1 normal

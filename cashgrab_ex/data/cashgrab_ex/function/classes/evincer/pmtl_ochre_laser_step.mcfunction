# classes/evincer/pmtl_ochre_laser_step.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the raycast step position
#	rotated: as the owner
#
# Summary: Evincer's Ochre Laser step function
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

particle minecraft:dust{color:[1.00,0.50,0.00],scale:1.25} ~ ~ ~ 0 0 0 0 1
particle minecraft:entity_effect{color:[1.00,0.50,0.00,1.00]} ~ ~ ~ 0 0 0 0 1

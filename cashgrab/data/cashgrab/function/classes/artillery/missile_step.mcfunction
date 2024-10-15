# classes/artillery/missile_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Artillery's missile step function
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

particle minecraft:dust_color_transition{from_color:[1.0f,0.5f,0.15f],to_color:[0.4f,0.4f,0.4f],scale:1.0f} ~ ~ ~ 0.035 0.035 0.035 0 2 force
particle minecraft:wax_on ~ ~ ~ 0 0 0 0 1 force

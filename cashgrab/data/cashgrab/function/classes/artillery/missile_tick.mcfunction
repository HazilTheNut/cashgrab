# classes/artillery/missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Artillery's missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Power Shot charge
#	cv_F	:	Power Shot cooldown, in ms
#	cv_G	:	
#	cv_H	:	

particle minecraft:dust_color_transition{from_color:[1.0f,0.5f,0.15f],to_color:[0.4f,0.4f,0.4f],scale:1.0f} ~ ~ ~ 0.035 0.035 0.035 0 2
particle minecraft:wax_on ~ ~ ~ 0 0 0 0 1 force

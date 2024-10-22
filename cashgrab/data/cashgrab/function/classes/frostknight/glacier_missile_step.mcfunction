# classes/frostknight/glacier_missile_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Frost Knight's missile step function
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

particle minecraft:block{block_state:"minecraft:packed_ice"} ~ ~ ~ 0 0 0 0 1
particle minecraft:dust{color:[0.7f,0.7f,1.0f],scale:1.0} ~ ~ ~ 0 0 0 0 1

# classes/hexblade/hex_missile_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hexblade's Hex missile step function
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

particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~ ~ 0.1 0.1 0.1 0 1
particle minecraft:mycelium ~ ~ ~ 0 0 0 0 2

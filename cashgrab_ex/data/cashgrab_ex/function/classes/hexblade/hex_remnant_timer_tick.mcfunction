# classes/hexblade/hex_remnant_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Hexblade's Hex remnant timer tick function (what player can teleport to after target player death)
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~1.5 ~ 0.1 0.1 0.1 0 3

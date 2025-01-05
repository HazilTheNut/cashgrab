# classes/hexblade/npe_destroy_hex_timer.mcfunction
#
# Context:
#	as: a non-player entity
#
# Summary: Destroys the currently-existing Hex timer
#
# Arguments:
#   hexblade_eid    : EID of the Hexblade originator of Hex timer

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# Search for Hex timers that point to Hexblade and schedule them for cleanup
$tag @e[tag=t_hexblade_hex_timer,scores={cv_B=$(hexblade_eid)}] add t_cleanup

# Nullify pointer to Hex target
$scoreboard players set @a[scores={eid_self=$(hexblade_eid)}] cv_A 0

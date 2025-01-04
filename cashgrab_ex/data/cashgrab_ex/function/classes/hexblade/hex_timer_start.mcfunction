# classes/hexblade/hex_timer_start.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#   rotated: as the timer's owner
#   + Hexblade Hex originator is tagged with t_hexblade_hex_originator
#
# Summary: Hexblade's Hex timer start function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# Apply glowing effect to owner
effect give @e[tag=t_timer_owner] minecraft:glowing 11

# Set pointer of Hex originator to my owner
scoreboard players operation @a[tag=t_hexblade_hex_originator,limit=1] cv_A = @s eid_self

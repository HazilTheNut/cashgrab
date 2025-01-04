# classes/hexblade/npe_apply_hex_timer.mcfunction
#
# Context:
#	as: a non-player entity
#   + Hexblade Hex originator is tagged with t_hexblade_hex_originator
#
# Summary: Generates a Hex timer that points back towards entity with t_hexblade_hex_originator
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

# Generate Hex timer
function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:220,\
b_anchor_at_pos:0,\
t_timer_name:"t_hexblade_hex_timer_init",\
func_npe_start:"cashgrab_ex:classes/hexblade/hex_timer_start",\
func_npe_tick:"cashgrab_ex:classes/hexblade/hex_timer_tick",\
func_npe_end:"cashgrab_ex:classes/hexblade/hex_timer_end",\
b_assign_as_peer:0,\
}

# Configure pointer on Hex timer
scoreboard players operation @n[tag=t_hexblade_hex_timer_init] cv_B = @a[tag=t_hexblade_hex_originator] eid_self

# Cleanup tags
tag @n[tag=t_hexblade_hex_timer_init] add t_hexblade_hex_timer
tag @n[tag=t_hexblade_hex_timer_init] remove t_hexblade_hex_timer_init

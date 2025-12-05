# classes/hexblade/hex_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#   rotated: as the timer's owner
#
# Summary: Hexblade's Hex timer tick function
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

# Display particles at hex target (other than remnant)
particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~2.5 ~ 0.1 0.1 0.1 0 1 force

# If you hit a target twice with Hex, the glowing effect removal takes priority over applying it
#   So on the first tick of lifetime, apply glowing effect again
execute if score @s tmr_lifetime_ticks matches 219 run effect give @e[tag=t_timer_owner] minecraft:glowing 11

# At specific timer lifetime values, pulse
execute if score @s tmr_lifetime_ticks matches 160 run function cashgrab_ex:classes/hexblade/hex_timer_pulse
execute if score @s tmr_lifetime_ticks matches 100 run function cashgrab_ex:classes/hexblade/hex_timer_pulse
execute if score @s tmr_lifetime_ticks matches 40 run function cashgrab_ex:classes/hexblade/hex_timer_pulse

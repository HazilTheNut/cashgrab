# classes/frostknight/glacier_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

# Pulse at regular intervals of timer lifetime
execute if score @s tmr_lifetime_ticks matches 161 run function cashgrab:classes/frostknight/glacier_timer_pulse
execute if score @s tmr_lifetime_ticks matches 121 run function cashgrab:classes/frostknight/glacier_timer_pulse
execute if score @s tmr_lifetime_ticks matches 81 run function cashgrab:classes/frostknight/glacier_timer_pulse
execute if score @s tmr_lifetime_ticks matches 41 run function cashgrab:classes/frostknight/glacier_timer_pulse
execute if score @s tmr_lifetime_ticks matches 1 run function cashgrab:classes/frostknight/glacier_timer_pulse

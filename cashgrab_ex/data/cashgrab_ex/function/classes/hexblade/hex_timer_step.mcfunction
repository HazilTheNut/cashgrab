# classes/hexblade/hex_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Hexblade's Hex timer step function
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
#	cv_H	:	

particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~2.5 ~ 0.1 0.1 0.1 0 3

# Find Hexblade source
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s cv_A
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# If no Hexblade source, self destruct
#execute unless entity @e[tag=t_eid_matches] run scoreboard players set @s tmr_lifetime_ticks 0
#execute unless entity @e[tag=t_eid_matches] run tag @s add t_cleanup

# Pulse at regular intervals of timer lifetime
execute if score @s tmr_lifetime_ticks matches 101 run function cashgrab_ex:classes/hexblade/hex_timer_pulse
execute if score @s tmr_lifetime_ticks matches 51 run function cashgrab_ex:classes/hexblade/hex_timer_pulse
execute if score @s tmr_lifetime_ticks matches 1 run function cashgrab_ex:classes/hexblade/hex_timer_pulse

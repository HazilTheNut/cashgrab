# classes/champion/npe_absorption_particle_timer_tick.mcfunction
#
# Context:
#	as: a Champion absorpion particle effect timer
#	at: the entity
#
# Summary: Displays crit particles to better communicate the health bonus
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Bastion (shield) durability/hits remaining
#	cv_F	:	Bastion (shield) refresh cooldown, in ms
#	cv_G	:	
#	cv_H	:	

execute unless entity @e[tag=t_timer_owner,tag=t_invisible] run particle minecraft:crit ~ ~1 ~ 0.5 0.25 0.5 0 5

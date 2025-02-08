# classes/stargazer/pmtl_stargazer_place_star_shower_timer.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:140,\
b_anchor_at_pos:1,\
t_timer_name:"t_stargazer_star_shower_timer_init",\
func_npe_start:"cashgrab_ex:classes/stargazer/npe_star_shower_timer_start",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_star_shower_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

rotate @n[tag=t_stargazer_star_shower_timer_init] ~ 0

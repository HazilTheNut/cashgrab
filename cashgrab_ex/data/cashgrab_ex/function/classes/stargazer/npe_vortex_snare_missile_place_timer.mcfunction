# classes/stargazer/npe_vortex_snare_missile_place_timer.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vortex Snare missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# If this position is too small, do nothing
execute align xyz positioned ~0.5 ~1 ~0.5 unless block ~ ~ ~ #cashgrab:nonsolid unless block ~ ~1 ~ #cashgrab:nonsolid run return 0

# Place timer and add remaining lifetime to it
execute align xyz positioned ~0.5 ~1 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:1,\
t_timer_name:"t_stargazer_vortex_snare_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_vortex_snare_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

scoreboard players operation @n[tag=t_stargazer_vortex_snare_timer_init] tmr_lifetime_ticks += @s mis_lifetime_ticks
tag @n[tag=t_stargazer_vortex_snare_timer_init] add t_stargazer_vortex_snare_timer
tag @n[tag=t_stargazer_vortex_snare_timer_init] remove t_stargazer_vortex_snare_timer_init


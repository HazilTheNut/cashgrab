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

#execute positioned ~ ~-1 ~ run function cashgrab:base/test/place_col_test_timer_line
#execute positioned ~ ~ ~ run function cashgrab:base/test/place_col_test_timer_line
#execute positioned ~ ~1 ~ run function cashgrab:base/test/place_col_test_timer_line

# If this position is too small, do nothing
execute unless block ~ ~-1 ~ #cashgrab:nonsolid unless block ~ ~1 ~ #cashgrab:nonsolid run return 0

# ================================
# Determine timer placement location
scoreboard players set @s temp_A 0

execute unless block ~ ~1 ~ #cashgrab:nonsolid run scoreboard players set @s temp_A -1
execute unless block ~ ~-1 ~ #cashgrab:nonsolid run scoreboard players set @s temp_A 1

# ================================
# Place timer and add remaining lifetime to it
execute if score @s temp_A matches -1 positioned ~ ~-0.25 ~ run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:1,\
t_timer_name:"t_stargazer_vortex_snare_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_vortex_snare_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

execute if score @s temp_A matches 0 positioned ~ ~0 ~ run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:1,\
t_timer_name:"t_stargazer_vortex_snare_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_vortex_snare_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

execute if score @s temp_A matches 1 positioned ~ ~0.75 ~ run function cashgrab:util/npe_create_timer {\
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


# classes/alchemist/translocator_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Alchemist's Translocator missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

# If space is insufficient, do nothing
execute unless block ~ ~1 ~ #cashgrab:nonsolid run return 0

# Spawn timer
execute align xyz positioned ~0.5 ~0.2 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:1,\
t_timer_name:"t_alchemist_translocator_timer_init",\
func_npe_start:"cashgrab:classes/alchemist/translocator_timer_start",\
func_npe_tick:"cashgrab:classes/alchemist/translocator_timer_tick",\
func_npe_end:"cashgrab:classes/alchemist/translocator_timer_end",\
b_assign_as_peer:1,\
}

tag @n[tag=t_alchemist_translocator_timer_init] add t_alchemist_translocator
tag @n[tag=t_alchemist_translocator_timer_init] add t_alchemist_translocator_timer
tag @n[tag=t_alchemist_translocator_timer_init] remove t_alchemist_translocator_timer_init

# trinkets/hedge_seed/npe_place_hedge_timer.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Places a Hedge timer
#
# Arguments: (none)

# Set timer for column of wall
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:200,\
b_anchor_at_pos:1,\
t_timer_name:"t_hedge_seed_column_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_timer_tick",\
func_npe_end:"cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_timer_end",\
b_assign_as_peer:1,\
}

# Initialize timer
scoreboard players set @n[tag=t_hedge_seed_column_timer_init] tv_B 0
scoreboard players set @n[tag=t_hedge_seed_column_timer_init] tv_C 0
scoreboard players set @n[tag=t_hedge_seed_column_timer_init] tv_D 1
tag @n[tag=t_hedge_seed_column_timer_init] add t_hedge_seed_column_timer
tag @n[tag=t_hedge_seed_column_timer_init] remove t_hedge_seed_column_timer_init

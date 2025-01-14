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

execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~ ~ 0.5 0.5 0.5 0 30 force

function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_line"}

# base/timer_at_self.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Runs timer at the location where it was created
#
# Arguments:
#	func_npe_tick		: Function to run every tick
#	func_npe_end		: Function to run when the timer expires
#						func_npe_end is supplied with an end_reason argument based on why func_npe_end was called
#                           end_reason 0   = cleaned up
#                           end_reason 1   = cleaned up from player death
#                           end_reason 10  = timer lifetime expired

# Run func_npe_tick or func_npe_end
$execute if entity @s[scores={tmr_lifetime_ticks=1..}] run function $(func_npe_tick)
$execute if entity @s[scores={tmr_lifetime_ticks=..0}] run function $(func_npe_end) {end_reason:10}

# base/timer_at_self.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Runs timer at the location where it was created
#
# Arguments:
#	func_step		: Function to run every tick
#	func_end		: Function to run when the timer expires
#						func_end is supplied with an end_reason argument based on why func_end was called: 0 = cleaned up, 1 = timer expired

# Run func_step or func_end
$execute if entity @s[scores={tmr_lifetime_ticks=1..}] run function $(func_step)
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=t_cleanup] run function $(func_end) {end_reason:0}
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=!t_cleanup] run function $(func_end) {end_reason:1}

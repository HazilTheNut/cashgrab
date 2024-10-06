# base/timer_main.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Top-level main function for timers
#
# Arguments:
#	func_step		: Function to run every tick
#	func_end		: Function to run when the timer expires
#						func_end is supplied with an end_reason argument based on why func_end was called: 0 = cleaned up, 1 = timer expired

# Get owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

tag @e[tag=t_eid_matches,limit=1] add t_timer_owner

# Run func_step or func_end
$execute if entity @s[scores={tmr_lifetime_ticks=1..}] at @e[tag=t_eid_matches,limit=1] run function $(func_step)
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=t_cleanup] at @e[tag=t_eid_matches,limit=1] run function $(func_end) {end_reason:0}
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=!t_cleanup] at @e[tag=t_eid_matches,limit=1] run function $(func_end) {end_reason:1}

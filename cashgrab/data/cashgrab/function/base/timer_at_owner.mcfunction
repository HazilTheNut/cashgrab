# base/timer_main.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Top-level main function for timers
#
# Arguments:
#	func_npe_step		: Function to run every tick
#	func_npe_end		: Function to run when the timer expires
#						func_npe_end is supplied with an end_reason argument based on why func_npe_end was called: 0 = cleaned up, 1 = timer expired

# Get owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Run func_npe_step or func_npe_end
$execute if entity @s[scores={tmr_lifetime_ticks=1..}] at @e[tag=t_eid_matches,limit=1] run function $(func_npe_step)
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=t_cleanup] at @e[tag=t_eid_matches,limit=1] run function $(func_npe_end) {end_reason:0}
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=!t_cleanup] at @e[tag=t_eid_matches,limit=1] run function $(func_npe_end) {end_reason:1}

# base/timer_at_owner.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Top-level main function for timers
#
# Arguments:
#	func_npe_tick		: Function to run every tick
#	func_npe_end		: Function to run when the timer expires
#						func_npe_end is supplied with an end_reason argument based on why func_npe_end was called: 0 = cleaned up, 1 = timer expired

# Get owner and tag them with t_timer_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches,limit=1] add t_timer_owner
tag @a[tag=t_eid_matches,limit=1] add t_timer_owner

# If there is no owner, self destruct
execute unless entity @e[tag=t_timer_owner] unless entity @a[tag=t_timer_owner] run return run function cashgrab:base/timer_end_cleanup

# Run func_npe_tick or func_npe_end
$execute unless entity @a[tag=t_timer_owner] if entity @s[scores={tmr_lifetime_ticks=1..}] at @e[tag=t_timer_owner,limit=1] rotated as @e[tag=t_timer_owner,limit=1] run function $(func_npe_tick)
$execute unless entity @a[tag=t_timer_owner] if entity @s[scores={tmr_lifetime_ticks=..0}] at @e[tag=t_timer_owner,limit=1] rotated as @e[tag=t_timer_owner,limit=1] run function $(func_npe_end) {end_reason:10}
$execute if entity @a[tag=t_timer_owner] if entity @s[scores={tmr_lifetime_ticks=1..}] at @a[tag=t_timer_owner,limit=1] rotated as @a[tag=t_timer_owner,limit=1] run function $(func_npe_tick)
$execute if entity @a[tag=t_timer_owner] if entity @s[scores={tmr_lifetime_ticks=..0}] at @a[tag=t_timer_owner,limit=1] rotated as @a[tag=t_timer_owner,limit=1] run function $(func_npe_end) {end_reason:10}

tag @e[tag=t_timer_owner] remove t_timer_owner
tag @a[tag=t_timer_owner] remove t_timer_owner

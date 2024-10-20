# base/timer_start.mcfunction
#
# Context:
#	as: a timer marker
#
# Summary: Runs start function based on whether is anchored at creation position or not
#
# Arguments:
#	func_npe_start		: Function to run

# If anchored at creation position, run func_npe_start at my position
$execute if entity @s[scores={tmr_anchor_pos=1..}] at @s rotated as @s run function $(func_npe_start)

execute if entity @s[scores={tmr_anchor_pos=1..}] run return 0

# If not anchored at creation position, get owner and tag them
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches,limit=1] add t_timer_owner

# Run func_npe_start at owner
$execute at @e[tag=t_timer_owner,limit=1] rotated as @e[tag=t_timer_owner,limit=1] run function $(func_npe_start)

tag @e[tag=t_timer_owner] remove t_timer_owner

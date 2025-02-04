# base/timer_end_cleanup.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Runs timer end function with the reason of being cleaned up
#
# Arguments:
#	func_npe_end		: Function to run when the timer expires
#						func_npe_end is supplied with an end_reason argument based on why func_npe_end was called
#                           end_reason 0   = cleaned up
#                           end_reason 1   = cleaned up from player death
#                           end_reason 10  = timer lifetime expired

# If timer is anchored at its creation position
$execute if entity @s[scores={tmr_anchor_pos=1..},tag=!t_cleanup_player_death] run function $(func_npe_end) {end_reason:0}
$execute if entity @s[scores={tmr_anchor_pos=1..},tag=t_cleanup_player_death] run function $(func_npe_end) {end_reason:1}
execute if entity @s[scores={tmr_anchor_pos=1..}] run kill @s
execute if entity @s[scores={tmr_anchor_pos=1..}] run return 0

# If timer not anchored at its creation position, find owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_timer_owner
tag @e[tag=t_eid_matches,limit=1] add t_timer_owner

execute unless entity @s[tag=t_cleanup_player_death] store result storage cashgrab:end_reason end_reason int 1.0 run scoreboard players get NUM_END_REASON_CLEANUP num
execute if entity @s[tag=t_cleanup_player_death] store result storage cashgrab:end_reason end_reason int 1.0 run scoreboard players get NUM_END_REASON_CLEANUP_PLAYER_DEATH num

$execute if entity @a[tag=t_timer_owner] at @a[tag=t_timer_owner,limit=1] rotated as @a[tag=t_timer_owner,limit=1] run function $(func_npe_end) with storage cashgrab:end_reason
$execute unless entity @a[tag=t_timer_owner] at @e[tag=t_timer_owner,limit=1] rotated as @e[tag=t_timer_owner,limit=1] run function $(func_npe_end) with storage cashgrab:end_reason

tag @a[tag=t_timer_owner] remove t_timer_owner
tag @e[tag=t_timer_owner] remove t_timer_owner

scoreboard players reset @s
kill @s

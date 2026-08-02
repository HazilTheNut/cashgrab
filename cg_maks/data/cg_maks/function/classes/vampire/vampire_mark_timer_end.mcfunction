# classes/vampire/vampire_mark_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Vampire's Mark timer end
#
# Arguments: (none)

$tellraw @a[tag=t_debug] "classes/vampire/vampire_mark_timer_end: end_reason $(end_reason)"
tellraw @a[tag=t_debug] ["classes/vampire/vampire_mark_timer_end: timer tags ",{"type":"nbt","nbt":"Tags","source":"entity","entity":"@s"}]

# Check if the timer was cleaned up due to its owner dying
$execute unless score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

tellraw @a[tag=t_debug] "found dead target"

# Tag originator and target entitys to ensure proper ownership of remnant.
tag @a[tag=t_timer_owner,limit=1] add t_vampire_marked_target
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches,scores={activity_state=21..29},limit=1] add t_vampire_mark_owner

# Heal the vampire owner
effect give @a[tag=t_vampire_mark_owner,limit=1] instant_health 1 0

# Clean up tags
tag @a remove t_vampire_marked_target
tag @a remove t_vampire_mark_owner
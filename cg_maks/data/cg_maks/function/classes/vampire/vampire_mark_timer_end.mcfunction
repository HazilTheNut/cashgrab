# classes/vampire/vampire_mark_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Vampire's Mark timer end
#
# Arguments: (none)

tellraw @a[tag=t_debug] "classes/vampire/vampire_mark_timer_end"

# If the timer expired naturally (by hitting 0), do nothing.
$execute unless score NUM_ZERO num matches $(end_reason) run return 0

# Check to see that the timer's owner still exists (i.e. they didn't log off).
execute unless entity @a[tag=t_timer_owner] run return 0
tellraw @a[tag=t_debug] "found dead target"

# Tag originator and target entitys to ensure proper ownership of remnant.
tag @a[tag=t_timer_owner,limit=1] add t_vampire_marked_target
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches,scores={activity_state=21..29},limit=1] add t_vampire_mark_owner

# Create remnant
tellraw @a[tag=t_debug] "attempting to create remnant..."
execute if entity @a[tag=t_vampire_mark_owner] run function cg_maks:classes/vampire/npe_vampire_create_remnant_at_marked_target

# Clean up tags
tag @a remove t_vampire_marked_target
tag @a remove t_vampire_mark_owner
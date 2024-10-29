# base/npe_cleanup.mcfunction
#
# Context:
#	as: a nonplayer entity with nonzero eid_state
#
# Summary: Tags self and subordinates to the executor and tags them all as t_cleanup
#
# Arguments: (none)

tellraw @a[tag=t_debug] [{"type":"text","text":"npe_cleanup eid_self: "},{"type":"score","score":{"name":"@s","objective":"eid_self"}}]

tag @s add t_cleanup

function cashgrab:util/npe_eid_find_subs

execute as @e[scores={eid_state=1..,eid_compare=0}] run function cashgrab:base/npe_cleanup_recursion

# If I am tagged as t_no_self_cleanup, I am not an entity that has code elsewhere that completes the cleanup
#	Thus, destroy myself
execute unless entity @s[tag=t_no_self_cleanup] run return 0
tp @s ~ ~-1000 ~
kill @s

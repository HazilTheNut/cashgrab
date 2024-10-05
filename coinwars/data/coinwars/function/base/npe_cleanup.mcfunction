# base/npe_cleanup.mcfunction
#
# Context:
#	as: a nonplayer entity with nonzero eid_state
#
# Summary: Recursively searches through all entities subordinate to the executor and tags them all as t_cleanup
#
# Arguments: (none)

tellraw @a[tag=t_debug] [{"type":"text","text":"npe_cleanup eid_self: "},{"type":"score","score":{"name":"@s","objective":"eid_self"}}]

function coinwars:util/npe_eid_find_subs

tag @e[scores={eid_state=1..,eid_compare=0}] add t_cleanup
execute as @e[scores={eid_state=1..,eid_compare=0}] run function coinwars:base/npe_cleanup_recursion

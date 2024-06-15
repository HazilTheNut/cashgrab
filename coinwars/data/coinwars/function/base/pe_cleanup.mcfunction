# base/pe_cleanup.mcfunction
#
# Context:
#	as: an entity with nonzero eid_state
#
# Summary: Recursively searches through all entities subordinate to the executor and tags them all as t_cleanup
#
# Arguments: (none)

tellraw @s[tag=t_debug] [{"type":"text","text":"pe_cleanup eid_self: "},{"type":"score","score":{"name":"@s","objective":"eid_self"}}]

function coinwars:util/pe_eid_find_subs

tag @e[scores={eid_state=1..,eid_compare=0}] add t_cleanup
execute as @e[scores={eid_state=1..,eid_compare=0}] run function coinwars:base/pe_cleanup_recursion

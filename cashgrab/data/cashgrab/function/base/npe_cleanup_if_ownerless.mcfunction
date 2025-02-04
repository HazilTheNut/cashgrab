# base/npe_cleanup_if_ownerless.mcfunction
#
# Context:
#	as:	a nonplayer entity
#
# Summary: Queries to see if the entity has an owner and performs cleanup if it does not find one
#
# Arguments: (none)

# If I have been cleaned up, assume all of my subordinates are too
execute if entity @s[tag=t_cleanup] run return 0

# Try to find my owner. If it exists, do nothing
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
execute if entity @e[tag=t_eid_matches] run return 0

tellraw @a[tag=t_debug] [{"type":"text","text":"npe_cleanup_if_ownerless eid_owner: "},{"type":"score","score":{"name":"@s","objective":"eid_owner"}}]

function cashgrab:base/npe_cleanup {b_self_destruct:1}

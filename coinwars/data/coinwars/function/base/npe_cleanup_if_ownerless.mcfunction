# base/npe_cleanup_if_ownerless.mcfunction
#
# Context:
#	as:	a nonplayer entity
#
# Summary: 
#
# Arguments: (none)

# If I have been cleaned up, assume all of my subordinates are too
execute if entity @s[tag=t_cleanup] run return 0

# Try to find my owner. If it exists, do nothing
execute store result storage coinwars:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function coinwars:util/gt_find_eid with storage coinwars:find_eid_args
execute if entity @e[tag=t_eid_matches] run return 0

tag @s add t_cleanup
function coinwars:base/npe_cleanup

# base/pm_cleanup_player_subs.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Searches for non-pm entitis owned by player and tags them for cleanup
#
# Arguments: (none)

# Find subordinates of player
execute store result storage coinwars:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function coinwars:util/find_eid_owned_by with storage coinwars:find_eid_args

# Tag them for cleanup
tag @e[tag=!t_pm,tag=t_eid_matches] add t_cleanup
execute as @e[tag=!t_pm,tag=t_eid_matches] run function coinwars:base/npe_cleanup

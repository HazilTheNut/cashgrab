# base/pm_cleanup_player_subs.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Searches for non-pm entities owned by player and tags them for cleanup
#
# Arguments:
#   b_player_died   :   1 iff cleanup occurred from player death

# Find subordinates of player
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_owned_by with storage cashgrab:find_eid_args

# If the player has died, propagate t_cleanup_player_death tag
$execute if score NUM_ONE num matches $(b_player_died) run tag @e[tag=!t_pm,tag=t_eid_matches] add t_cleanup_player_death

# Tag them for cleanup
execute as @e[tag=!t_pm,tag=t_eid_matches] run function cashgrab:base/npe_cleanup

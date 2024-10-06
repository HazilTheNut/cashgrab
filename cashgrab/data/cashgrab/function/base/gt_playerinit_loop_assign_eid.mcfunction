# base/gt_playerinit_loop_assign_eid.mcfunction
#
# Context: Global tick
#
# Summary: Assigns a unique random EID to a player with tag t_player_initialize
#
# Arguments: (none)

# Assign a random EID
execute store result score @a[tag=t_player_initialize,limit=1] eid_self run random value 1..9999

# Search existing entities to see if someone already has that EID
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @a[tag=t_player_initialize,limit=1] eid_self
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

tellraw @a[tag=t_debug] [{"type":"text","text":"gt_playerinit_loop_assign_eid attempted eid_self: "},{"type":"score","score":{"name":"@a[tag=t_player_initialize,limit=1]","objective":"eid_self"}}]

# If an entity with eid_state >= 1 has t_eid_matches, then we cannot use the above randomly generated EID and must loop this function
execute if entity @e[tag=t_eid_matches] run function cashgrab:base/gt_playerinit_loop_assign_eid_recursion

# This is for testing purposes to force fake conflicts and cause recursion
#execute if entity @a[tag=t_player_initialize,limit=1,scores={eid_self=50..}] run function cashgrab:base/gt_playerinit_loop_assign_eid_recursion

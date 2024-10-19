# util/npe_col_detect_entity.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the location being checked for collision
#
# Summary: Runs collision detection algorithm for entities at the execution position.
#
# Arguments:
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities that can collide with
#
# Returns: 1 if the collision detection found an entity and 0 otherwise. If the collision detection found an entity, they will be tagged with "t_collision_found".

# Run filter function
$function $(func_npe_entity_filter)

tag @e remove t_collision_found

# Find collision candidates within the hitbox (three 0.85m radius spheres vertically stacked on each other)
execute positioned ~ ~-0.0 ~ run tag @e[tag=t_collision_candidate,distance=..0.8] add t_collision_found
execute positioned ~ ~-0.9 ~ run tag @e[tag=t_collision_candidate,distance=..0.8] add t_collision_found
execute positioned ~ ~-1.8 ~ run tag @e[tag=t_collision_candidate,distance=..0.8] add t_collision_found

# Return 1 if any were found
execute if entity @e[tag=t_collision_found] run return 1

return 0

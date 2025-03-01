# base/npe_raycast_loop.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Performs initial raycasting checks
#
# Arguments:
#	delta_x				: Change in x position per step of raycast
#	delta_y				: Change in y position per step of raycast
#	delta_z				: Change in z position per step of raycast
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities that can collide with
#	func_npe_step			: String function name to run every tick
#	func_npe_end			: String function name to run when either the missile collides or expires
#								func_npe_end is supplied with an end_reason argument based on why func_end was called:
#                               end_reason 10  = reached end of raycast
#                               end_reason 20  = raycast struck terrain
#                               end_reason 30  = raycast hit an entity

# Perform immediate collision detection
$execute if block ~ ~ ~ $(col_terrain_allowed) run function $(func_npe_end) {end_reason:21}
$execute if block ~ ~ ~ $(col_terrain_allowed) run return 0

# Begin raycast loop
function cashgrab:base/npe_raycast_loop with storage cashgrab:rc_args data

# base/npe_raycast.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Performs a raycast at the execution location and rotation
#
# Arguments:
#	i_range_m				: Maximum distance of raycast, in meters. Longer distances cost more CPU resources
#	i_origin_loc			: Where the missile originates: 0 = aligned with camera, 1 = right-handed position, 2 = left-handed position
#	col_terrain_allowed		: Block tag or block type that describes what counts as not solid collision
#	b_fit_player			: If nonzero, raycast will try to call func_end where a player can stand if they can one step further ("ascending" ledges and lowering if heading into a ceiling)
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities the missile can collide with
#	func_npe_step			: String function name to run on each raycast step
#	func_npe_end			: String function name to run when either the missile collides or expires
#								func_end is supplied with an end_reason argument based on why func_end was called:
#                               end_reason 10  = reached end of raycast
#                               end_reason 20  = raycast struck terrain
#                               end_reason 30  = raycast hit an entity

$scoreboard players set @s rc_steps_remaining $(i_range_m)
scoreboard players operation @s rc_steps_remaining *= NUM_RAYCAST_STEPS_PER_M num

$scoreboard players set @s __rc_fit_player $(b_fit_player)
$scoreboard players set @s __rc_align_camera $(i_origin_loc)

$data merge storage cashgrab:rc_args {data:{col_terrain_allowed:"$(col_terrain_allowed)",func_npe_entity_filter:"$(func_npe_entity_filter)",func_npe_step:"$(func_npe_step)",func_npe_end:"$(func_npe_end)",delta_x:0.0f,delta_y:0.0f,delta_z:0.0f}}

execute if entity @s[scores={__rc_align_camera=0}] facing ^ ^ ^1 run function cashgrab:util/npe_calc_facing_vector {magnitude:0.5f}
$execute if entity @s[scores={__rc_align_camera=1}] facing ^0.5 ^0.3 ^$(i_range_m) run function cashgrab:util/npe_calc_facing_vector {magnitude:0.5f}
$execute if entity @s[scores={__rc_align_camera=2}] facing ^-0.5 ^-0.3 ^$(i_range_m) run function cashgrab:util/npe_calc_facing_vector {magnitude:0.5f}


execute store result storage cashgrab:rc_args data.delta_x float 0.001 run scoreboard players get @s facing_vector_x_mm
execute store result storage cashgrab:rc_args data.delta_y float 0.001 run scoreboard players get @s facing_vector_y_mm
execute store result storage cashgrab:rc_args data.delta_z float 0.001 run scoreboard players get @s facing_vector_z_mm

#tellraw @a[tag=t_debug] [{"type":"text","text":"Raycast data: "},{"type":"nbt","source":"storage","storage":"cashgrab:rc_args","nbt":"data"}]

$function $(func_npe_entity_filter)

execute if entity @s[scores={__rc_align_camera=0}] anchored eyes positioned ^ ^ ^ run function cashgrab:base/npe_raycast_loop with storage cashgrab:rc_args data
execute if entity @s[scores={__rc_align_camera=1}] anchored eyes positioned ^-0.5 ^-0.3 ^ run function cashgrab:base/npe_raycast_loop with storage cashgrab:rc_args data
execute if entity @s[scores={__rc_align_camera=2}] anchored eyes positioned ^0.5 ^-0.3 ^ run function cashgrab:base/npe_raycast_loop with storage cashgrab:rc_args data

tag @e remove t_collision_candidate

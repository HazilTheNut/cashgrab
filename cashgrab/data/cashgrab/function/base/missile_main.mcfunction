# base/missile_main.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Top level function runner for missiles
#
# Arguments:
#	vel_x					: Missile x velocity, in meters/tick
#	vel_y					: Missile y velocity, in meters/tick
#	vel_z					: Missile z velocity, in meters/tick
#	magnitude				: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection
#	f_tracking_scalar		: Scalar of strength of tracking towards potential targets
#	f_tracking_radius		: Missile tracking is only applied when a potential target is within this radius
#	col_terrain_allowed		: Block tag or block type that describes what counts as not solid collision
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities the missile can collide with
#	func_npe_tick			: String function name to run every tick
#	func_npe_end			: String function name to run when either the missile collides or expires

# Self-destruct if cleaned up
$execute if entity @s[tag=t_cleanup] run function $(func_npe_end) {end_reason:0}
execute if entity @s[tag=t_cleanup] run kill @s
execute if entity @s[tag=t_cleanup] run return 0

scoreboard players set @s mis_func_tick_dyaw_mdeg 0
scoreboard players set @s mis_func_tick_dpitch_mdeg 0

$execute if entity @s[scores={mis_lifetime_ticks=1..}] run function $(func_npe_tick)

# If in stasis, do not apply physics, motion, or hit detection
execute if score @s stasis_state matches 1..2 run return 0

# If tracking is enabled, calculate tracking angle deflection
execute if entity @s[tag=t_missile_has_tracking] run function cashgrab:base/missile_tracking with entity @s data

# Sum angle deflections from missile func_tick and tracking system
function cashgrab:base/missile_sum_angle_deflections

# Recalculate base velocity if needed
execute if entity @s[tag=t_missile_calc_base_vel] run function cashgrab:base/missile_calc_base_vel with entity @s data
tag @s remove t_missile_calc_base_vel

# If gravity is enabled, add gravitational velocity to missile
execute if entity @s[tag=t_missile_has_gravity] run function cashgrab:base/missile_gravity with entity @s data

# Sum missile velocity scoreboard values to and write marker data if needed
execute if entity @s[tag=t_missile_write_vel_to_data] run function cashgrab:base/missile_write_vel_to_data with entity @s data
tag @s remove t_missile_write_vel_to_data

# Run missile collision detection and traveling forwards
function cashgrab:base/missile_travel with entity @s data

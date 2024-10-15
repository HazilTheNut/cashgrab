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
#	vel_x				: Missile x velocity, in meters/tick
#	vel_y				: Missile y velocity, in meters/tick
#	vel_z				: Missile z velocity, in meters/tick
#	magnitude			: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection
#	f_tracking_scalar	: Scalar of strength of tracking towards potential targets
#	f_tracking_radius	: Missile tracking is only applied when a potential target is within this radius
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities the missile can collide with
#	func_step			: String function name to run every tick
#	func_end			: String function name to run when either the missile collides or expires

# Self-destruct if cleaned up
$execute if entity @s[tag=t_cleanup] run function $(func_end) {end_reason:0}
execute if entity @s[tag=t_cleanup] run kill @s
execute if entity @s[tag=t_cleanup] run return 0

scoreboard players set @s mis_func_step_dyaw_mdeg 0
scoreboard players set @s mis_func_step_dpitch_mdeg 0

$execute if entity @s[scores={mis_lifetime_ticks=1..}] run function $(func_step)

# If in stasis, do not apply physics, motion, or hit detection
execute if score @s stasis_state matches 1..2 run return 0

#tellraw @a[tag=t_debug] [{"type":"text","text":"Tracking magnitude: "},{"type":"nbt","nbt":"data.f_tracking_scalar","entity":"@s"}]

# Run physics effects on missiles to calculate vel_x, vel_y, and vel_z
function cashgrab:base/missile_physics with entity @s data

tag @e remove t_collision_candidate

# Run missile collision detection and traveling forwards
function cashgrab:base/missile_travel with entity @s data

# Remove t_collision_candidate tags to not interfere with other missiles
tag @e remove t_collision_candidate

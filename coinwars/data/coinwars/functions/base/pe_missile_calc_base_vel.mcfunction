# base/pe_missile_calc_base_vel.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Recalculates a missile's base velocity (before applying gravity) based on its speed and facing angle adjusted by tracking_dyaw and tracking_dpitch
#
# Arguments:
#	f_speed_mpt			: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection
#	tracking_dyaw		: Yaw adjustment, in degrees
#	tracking_dpitch		: Pitch adjustment, in degrees

#$tellraw @a[tag=t_debug] "f_speed_mpt = $(f_speed_mpt), tracking_dyaw = $(tracking_dyaw), tracking_dpitch = $(tracking_dpitch)"

$execute rotated ~$(tracking_dyaw) ~$(tracking_dpitch) run function coinwars:util/pe_calc_facing_vector {magnitude:$(f_speed_mpt)f}
#function coinwars:util/pe_calc_facing_vector with entity @s data
scoreboard players operation @s mis_base_vel_x_mmpt = @s facing_vector_x_mm
scoreboard players operation @s mis_base_vel_y_mmpt = @s facing_vector_y_mm
scoreboard players operation @s mis_base_vel_z_mmpt = @s facing_vector_z_mm

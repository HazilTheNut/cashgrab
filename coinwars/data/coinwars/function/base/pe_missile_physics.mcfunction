# base/pe_missile_physics.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Applies forces and rotation corrections of gravity and tracking respectively
#
# Arguments:
#	f_tracking_scalar		: Scalar of strength of tracking towards potential targets

# Initialize sum at base values


# Apply projectile tracking
#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics: Yaw: "},{"type":"nbt","source":"entity","nbt":"Rotation[0]","entity":"@s"},{"type":"text","text":" Pitch: "},{"type":"nbt","source":"entity","nbt":"Rotation[1]","entity":"@s"}]

$execute if entity @s[tag=t_missile_has_tracking] run function $(func_tracking_filter)
execute if entity @s[tag=t_missile_has_tracking] if entity @e[tag=t_collision_candidate,tag=!t_do_not_track] run function coinwars:base/pe_missile_physics_tracking with entity @s data

# Apply tracking scalar to dyaw and dpitch from missile tracking
$execute if entity @s[tag=t_missile_has_tracking] store result entity @s data.tracking_dyaw float $(f_tracking_scalar) run scoreboard players get @s mis_tracking_dyaw_mdeg
execute if entity @s[tag=t_missile_has_tracking] store result score @s mis_tracking_dyaw_mdeg run data get entity @s data.tracking_dyaw 1

$execute if entity @s[tag=t_missile_has_tracking] store result entity @s data.tracking_dpitch float $(f_tracking_scalar) run scoreboard players get @s mis_tracking_dpitch_mdeg
execute if entity @s[tag=t_missile_has_tracking] store result score @s mis_tracking_dpitch_mdeg run data get entity @s data.tracking_dpitch 1

# Add pitch and yaw deflection of both func_step and projectile tracking
scoreboard players operation @s mis_func_step_dyaw_mdeg += @s mis_tracking_dyaw_mdeg
scoreboard players operation @s mis_func_step_dpitch_mdeg += @s mis_tracking_dpitch_mdeg

# Write final angle adjustment
execute store result entity @s data.tracking_dyaw float 0.001 run scoreboard players get @s mis_func_step_dyaw_mdeg
execute store result entity @s data.tracking_dpitch float 0.001 run scoreboard players get @s mis_func_step_dpitch_mdeg

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics: dYaw: "},{"type":"nbt","source":"entity","nbt":"data.tracking_dyaw","entity":"@s"},{"type":"text","text":" dPitch: "},{"type":"nbt","source":"entity","nbt":"data.tracking_dpitch","entity":"@s"}]

# Recalculate base velocity if missile facing angle needs to change
execute unless entity @s[scores={mis_func_step_dyaw_mdeg=0,mis_func_step_dpitch_mdeg=0}] run tag @s add t_missile_calc_base_vel
execute if entity @s[tag=t_missile_calc_base_vel] run function coinwars:base/pe_missile_calc_base_vel with entity @s data
tag @s remove t_missile_calc_base_vel

scoreboard players operation @s mis_sum_vel_x_mmpt = @s mis_base_vel_x_mmpt
scoreboard players operation @s mis_sum_vel_y_mmpt = @s mis_base_vel_y_mmpt
scoreboard players operation @s mis_sum_vel_z_mmpt = @s mis_base_vel_z_mmpt

# Apply projectile gravity
scoreboard players operation @s[tag=t_missile_has_gravity] mis_gravity_vel_y_mmpt -= @s mis_gravity_const_mmpt2
scoreboard players operation @s[tag=t_missile_has_gravity] mis_sum_vel_y_mmpt += @s mis_gravity_vel_y_mmpt

# Apply speed limit so missiles don't travel so fast as to fly through walls or miss their targets
scoreboard players set @s[scores={mis_sum_vel_x_mmpt=1000..}] mis_sum_vel_x_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_x_mmpt=..-1000}] mis_sum_vel_x_mmpt -1000
scoreboard players set @s[scores={mis_sum_vel_y_mmpt=1000..}] mis_sum_vel_y_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_y_mmpt=..-1000}] mis_sum_vel_y_mmpt -1000
scoreboard players set @s[scores={mis_sum_vel_z_mmpt=1000..}] mis_sum_vel_z_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_z_mmpt=..-1000}] mis_sum_vel_z_mmpt -1000

execute store result entity @s data.vel_x float 0.001 run scoreboard players get @s mis_sum_vel_x_mmpt
execute store result entity @s data.vel_y float 0.001 run scoreboard players get @s mis_sum_vel_y_mmpt
execute store result entity @s data.vel_z float 0.001 run scoreboard players get @s mis_sum_vel_z_mmpt

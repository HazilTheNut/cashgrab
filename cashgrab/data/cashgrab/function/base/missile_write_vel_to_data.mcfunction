# base/missile_physics.mcfunction
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

# =============================
# Sum together component velocities

# x
scoreboard players operation @s mis_sum_vel_x_mmpt = @s mis_base_vel_x_mmpt

# y
scoreboard players operation @s mis_sum_vel_y_mmpt = @s mis_base_vel_y_mmpt
scoreboard players operation @s mis_sum_vel_y_mmpt += @s mis_gravity_vel_y_mmpt

# z
scoreboard players operation @s mis_sum_vel_z_mmpt = @s mis_base_vel_z_mmpt

# =============================
# Post processing

# Apply speed limit so missiles don't travel so fast that they would phase through walls or miss their targets
scoreboard players set @s[scores={mis_sum_vel_x_mmpt=1000..}] mis_sum_vel_x_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_x_mmpt=..-1000}] mis_sum_vel_x_mmpt -1000
scoreboard players set @s[scores={mis_sum_vel_y_mmpt=1000..}] mis_sum_vel_y_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_y_mmpt=..-1000}] mis_sum_vel_y_mmpt -1000
scoreboard players set @s[scores={mis_sum_vel_z_mmpt=1000..}] mis_sum_vel_z_mmpt 1000
scoreboard players set @s[scores={mis_sum_vel_z_mmpt=..-1000}] mis_sum_vel_z_mmpt -1000

# =============================
# Write data
execute store result entity @s data.vel_x float 0.001 run scoreboard players get @s mis_sum_vel_x_mmpt
execute store result entity @s data.vel_y float 0.001 run scoreboard players get @s mis_sum_vel_y_mmpt
execute store result entity @s data.vel_z float 0.001 run scoreboard players get @s mis_sum_vel_z_mmpt

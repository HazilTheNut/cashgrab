# base/missile_sum_angle_deflections.mcfunction
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

# Add pitch and yaw deflection of both func_npe_tick and projectile tracking
scoreboard players operation @s mis_func_step_dyaw_mdeg += @s mis_tracking_dyaw_mdeg
scoreboard players operation @s mis_func_step_dpitch_mdeg += @s mis_tracking_dpitch_mdeg

# Write final angle adjustment
execute store result entity @s data.tracking_dyaw float 0.001 run scoreboard players get @s mis_func_step_dyaw_mdeg
execute store result entity @s data.tracking_dpitch float 0.001 run scoreboard players get @s mis_func_step_dpitch_mdeg

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics: dYaw: "},{"type":"nbt","source":"entity","nbt":"data.tracking_dyaw","entity":"@s"},{"type":"text","text":" dPitch: "},{"type":"nbt","source":"entity","nbt":"data.tracking_dpitch","entity":"@s"}]

# Recalculate base velocity if missile facing angle needs to change
execute unless entity @s[scores={mis_func_step_dyaw_mdeg=0,mis_func_step_dpitch_mdeg=0}] run tag @s add t_missile_calc_base_vel

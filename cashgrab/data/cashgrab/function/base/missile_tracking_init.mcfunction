# base/missile_tracking_init.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Initializes tracking behavior of missiles
#
# Arguments:
#	f_tracking_scalar			: Scalar of strength of tracking towards potential targets
#	func_npe_tracking_filter	: Used for determining targets to track towards

# Calculate minimum and maximum displacement angles to apply tracking to
scoreboard players set @s mis_tracking_max_angle_mdeg 0
execute store result score @s mis_tracking_max_angle_mdeg run data get entity @s data.f_tracking_scalar 10000
scoreboard players add @s mis_tracking_max_angle_mdeg 10000
scoreboard players operation @s mis_tracking_min_angle_mdeg = @s mis_tracking_max_angle_mdeg
scoreboard players operation @s mis_tracking_min_angle_mdeg *= NUM_NEG_ONE num

# Clear tag
tag @s remove t_missile_init_tracking

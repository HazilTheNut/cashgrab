# base/missile_physics.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Applies gravitational force to missile
#
# Arguments: (none)

# Apply missile gravity
scoreboard players operation @s mis_gravity_vel_y_mmpt -= @s mis_gravity_const_mmpt2

# Write velocity data at later portion of missile main
tag @s add t_missile_write_vel_to_data


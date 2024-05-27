# base/pe_missile_physics_tracking.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Performs tracking behavior of missiles
#
# Arguments:
#	f_tracking_scalar			: Scalar of strength of tracking towards potential targets

# If t_missile_calc_tracking is set, calculate minimum and maximum displacement angles to apply tracking to
scoreboard players set @s[tag=t_missile_calc_tracking] mis_tracking_max_angle_mdeg 0
execute if entity @s[tag=t_missile_calc_tracking] store result score @s mis_tracking_max_angle_mdeg run data get entity @s data.f_tracking_scalar 10000
scoreboard players add @s[tag=t_missile_calc_tracking] mis_tracking_max_angle_mdeg 10000
scoreboard players operation @s[tag=t_missile_calc_tracking] mis_tracking_min_angle_mdeg = @s[tag=t_missile_calc_tracking] mis_tracking_max_angle_mdeg
scoreboard players operation @s[tag=t_missile_calc_tracking] mis_tracking_min_angle_mdeg *= NUM_NEG_ONE num
tag @s remove t_missile_calc_tracking

# Calculate yaw and pitch of direction facing towards tracking target
execute facing entity @e[tag=t_collision_candidate,tag=!t_do_not_track,limit=1,sort=nearest] eyes run function coinwars:util/pe_calc_facing_vector {magnitude:1.0f}
scoreboard players operation @s mis_tracking_dyaw_mdeg = @s facing_vector_yaw_mdeg
scoreboard players operation @s mis_tracking_dpitch_mdeg = @s facing_vector_pitch_mdeg

# Retrieve current yaw and pitch from nbt data
execute store result score @s facing_vector_yaw_mdeg run data get entity @s Rotation[0] 1000
execute store result score @s facing_vector_pitch_mdeg run data get entity @s Rotation[1] 1000

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics_tracking:"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  facing_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"facing_vector_yaw_mdeg"}}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  goal_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"mis_tracking_dyaw_mdeg"}}]

# facing_vector rotation = my current rotation while mis_tracking rotation = rotation towards target

# =============================
# Yaw correction angle calculation

# mis_tracking_dyaw_mdeg -= facing_vector_yaw_mdeg
scoreboard players operation @s mis_tracking_dyaw_mdeg -= @s facing_vector_yaw_mdeg
#tellraw @a[tag=t_debug] [{"type":"text","text":"  yaw_diff: "},{"type":"score","score":{"name":"@s","objective":"mis_tracking_dyaw_mdeg"}}]

# adjust difference if the distance across the angle circle's seam (where -180 is adjacent to 180) is shorter
scoreboard players add @s[scores={mis_tracking_dyaw_mdeg=..-180000}] mis_tracking_dyaw_mdeg 360000
scoreboard players remove @s[scores={mis_tracking_dyaw_mdeg=180000..}] mis_tracking_dyaw_mdeg 360000
#tellraw @a[tag=t_debug] [{"type":"text","text":"  yaw_diff_c: "},{"type":"score","score":{"name":"@s","objective":"mis_tracking_dyaw_mdeg"}}]

# =============================
# Pitch correction angle calculation

# Pitch correction angle calculation is (mis_tracking_dpitch_mdeg - facing_vector_pitch_mdeg) * f_tracking_scalar
# mis_tracking_dpitch_mdeg -= facing_vector_pitch_mdeg
scoreboard players operation @s mis_tracking_dpitch_mdeg -= @s facing_vector_pitch_mdeg

# =============================
# Post-processing

# Give up if target is further than 30 degrees away
execute if score @s mis_tracking_dyaw_mdeg < @s mis_tracking_min_angle_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dpitch_mdeg < @s mis_tracking_min_angle_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dyaw_mdeg > @s mis_tracking_max_angle_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dpitch_mdeg > @s mis_tracking_max_angle_mdeg run tag @s add t_give_up
scoreboard players set @s[tag=t_give_up] mis_tracking_dyaw_mdeg 0
scoreboard players set @s[tag=t_give_up] mis_tracking_dpitch_mdeg 0
tag @s remove t_give_up

# Angle displacement is divded by a constant for more zeno-ian tracking versus just snapping onto the target
scoreboard players operation @s mis_tracking_dyaw_mdeg /= NUM_MISSILE_TRACKING_DIVISOR num
scoreboard players operation @s mis_tracking_dpitch_mdeg /= NUM_MISSILE_TRACKING_DIVISOR num

# =============================
# Apply tracking correction angles to data.tracking_dyaw and data.tracking_dpitch




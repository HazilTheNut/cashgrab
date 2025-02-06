# base/missile_tracking_find_eid_pm.mcfunction
#
# Context:
#	as: a Player Monitor (PM) marker
#
# Summary: Calculates angle difference versus missile direction
#
# Arguments: (none)

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# If player is not a candidate, return
execute if entity @a[tag=t_pm_owner,tag=!t_collision_candidate] run return run tag @a remove t_pm_owner

# Player must be in gameplay state
execute unless score @a[tag=t_pm_owner,limit=1] activity_state matches 21..29 run return run tag @a remove t_pm_owner

# Calculate player facing angle
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0}

# Store player facing angle onto missile then subtract by its facing angle
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_yaw_mdeg = @s facing_vector_yaw_mdeg
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_yaw_mdeg -= @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing_vector_yaw_mdeg
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_pitch_mdeg = @s facing_vector_pitch_mdeg
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_pitch_mdeg -= @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing_vector_pitch_mdeg

# Get absolute value of angle differences
execute as @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] if score @s __mis_tracking_temp_angle_diff_yaw_mdeg matches ..0 run scoreboard players operation @s __mis_tracking_temp_angle_diff_yaw_mdeg *= NUM_NEG_ONE num
execute as @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] if score @s __mis_tracking_temp_angle_diff_pitch_mdeg matches ..0 run scoreboard players operation @s __mis_tracking_temp_angle_diff_pitch_mdeg *= NUM_NEG_ONE num

# If either angle difference is less the missile's current nearest angle, update and set EID target
execute as @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] if score @s __mis_tracking_temp_angle_diff_yaw_mdeg < @s __mis_tracking_nearest_angle_min_mdeg run tag @s add t_missile_tracking_update_nearest_angle
execute as @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] if score @s __mis_tracking_temp_angle_diff_pitch_mdeg < @s __mis_tracking_nearest_angle_min_mdeg run tag @s add t_missile_tracking_update_nearest_angle

scoreboard players operation @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_nearest_angle_yaw_mdeg = @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_yaw_mdeg
scoreboard players operation @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_nearest_angle_pitch_mdeg = @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_temp_angle_diff_pitch_mdeg
execute as @e[tag=t_missile_tracking_update_nearest_angle,limit=1] if score @s __mis_tracking_nearest_angle_yaw_mdeg <= @s __mis_tracking_nearest_angle_pitch_mdeg run scoreboard players operation @s __mis_tracking_nearest_angle_min_mdeg = @s __mis_tracking_nearest_angle_yaw_mdeg
execute as @e[tag=t_missile_tracking_update_nearest_angle,limit=1] if score @s __mis_tracking_nearest_angle_yaw_mdeg > @s __mis_tracking_nearest_angle_pitch_mdeg run scoreboard players operation @s __mis_tracking_nearest_angle_min_mdeg = @s __mis_tracking_nearest_angle_pitch_mdeg
scoreboard players operation @e[tag=t_missile_tracking_update_nearest_angle,limit=1] mis_tracking_target_eid = @s eid_owner

# Clean up tags
tag @a remove t_pm_owner
tag @e remove t_missile_tracking_update_nearest_angle

# base/missile_tracking_find_eid_main.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Top-level function for missile tracking nearest angle search
#
# Arguments:
#	f_tracking_scalar			: Scalar of strength of tracking towards potential targets
#	func_npe_tracking_filter	: Used for determining targets to track towards

# Initialize variables to default
scoreboard players set @s __mis_tracking_nearest_angle_dp_term_um 0
scoreboard players set @s __mis_tracking_nearest_angle_dp_sum_um 0
scoreboard players set @s mis_tracking_target_eid 0

# Don't want missile tracking towards targets behind it, 
#   so set a minimum for dot product equal to 0.975 - f_tracking_scalar
#   (giveup angle ranges from 12.83 to 91.43 degrees from 0 to 1 f_tracking_scalar)
execute store result score @s __mis_tracking_nearest_angle_dp_max_um run data get entity @s data.f_tracking_scalar -1000000
scoreboard players add @s __mis_tracking_nearest_angle_dp_max_um 975000

# Calculate missile's facing angle - this writes to facing_vector_yaw_mdeg and facing_vector_pitch_mdeg
function cashgrab:util/npe_calc_facing_vector {magnitude:1.0}

tellraw @a[tag=t_debug] [{"color":"yellow","text":"\nbase/missile_tracking_find_eid_main dp min = "},{"score":{"name":"@s","objective":"__mis_tracking_nearest_angle_dp_max_um"}}]

# Tag myself as the missile performing calculation
tag @s add t_missile_tracking_calc_nearest_angle

# Run entity tracking filter function
$function $(func_npe_tracking_filter)

# Perform nearest angle comparisons for entities within 50 meters
execute as @e[tag=t_collision_candidate,distance=..50,tag=!t_invisible] at @s rotated as @s run function cashgrab:base/missile_tracking_find_eid_npe

# Perform nearest angle comparisons for players
execute as @e[tag=t_pm] run function cashgrab:base/missile_tracking_find_eid_pm

# Cleanup tags
tag @s remove t_missile_tracking_calc_nearest_angle


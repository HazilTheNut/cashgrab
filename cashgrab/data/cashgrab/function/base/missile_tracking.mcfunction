# base/missile_tracking.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Performs tracking behavior of missiles
#
# Arguments:
#	func_npe_tracking_filter	: Used for determining targets to track towards

# Run filter function
$function $(func_npe_tracking_filter)

scoreboard players set @s mis_tracking_dyaw_mdeg 0
scoreboard players set @s mis_tracking_dpitch_mdeg 0

# If no entity found, do no track onto nothing
execute unless entity @e[tag=t_collision_candidate,tag=!t_invisible] run return 0

# If t_missile_init_tracking is set, calculate minimum and maximum displacement angles to apply tracking to
execute if entity @s[tag=t_missile_init_tracking] run function cashgrab:base/missile_tracking_init with entity @s data

# Calculate yaw and pitch of direction facing towards tracking target
execute facing entity @e[tag=t_collision_candidate,tag=!t_invisible,limit=1,sort=nearest] eyes run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0f}
scoreboard players operation @s mis_tracking_dyaw_mdeg = @s facing_vector_yaw_mdeg
scoreboard players operation @s mis_tracking_dpitch_mdeg = @s facing_vector_pitch_mdeg

# Retrieve current yaw and pitch from nbt data
execute store result score @s facing_vector_yaw_mdeg run data get entity @s Rotation[0] 1000
execute store result score @s facing_vector_pitch_mdeg run data get entity @s Rotation[1] 1000

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics_tracking:"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  facing_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"facing_vector_yaw_mdeg"}}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  goal_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"mis_tracking_dyaw_mdeg"}}]

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

# mis_tracking_dpitch_mdeg -= facing_vector_pitch_mdeg
scoreboard players operation @s mis_tracking_dpitch_mdeg -= @s facing_vector_pitch_mdeg

# =============================
# Post-processing

# Give up if target is further than give-up angle
execute if score @s mis_tracking_dyaw_mdeg < @s __mis_tracking_giveup_min_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dpitch_mdeg < @s __mis_tracking_giveup_min_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dyaw_mdeg > @s __mis_tracking_giveup_max_mdeg run tag @s add t_give_up
execute if score @s mis_tracking_dpitch_mdeg > @s __mis_tracking_giveup_max_mdeg run tag @s add t_give_up
scoreboard players set @s[tag=t_give_up] mis_tracking_dyaw_mdeg 0
scoreboard players set @s[tag=t_give_up] mis_tracking_dpitch_mdeg 0
tag @s remove t_give_up

# Cap tracking angle displacements 
execute if score @s mis_tracking_dyaw_mdeg < @s __mis_tracking_adjust_min_mdeg run scoreboard players operation @s mis_tracking_dyaw_mdeg = @s __mis_tracking_adjust_min_mdeg
execute if score @s mis_tracking_dpitch_mdeg < @s __mis_tracking_adjust_min_mdeg run scoreboard players operation @s mis_tracking_dpitch_mdeg = @s __mis_tracking_adjust_min_mdeg
execute if score @s mis_tracking_dyaw_mdeg > @s __mis_tracking_adjust_max_mdeg run scoreboard players operation @s mis_tracking_dyaw_mdeg = @s __mis_tracking_adjust_max_mdeg
execute if score @s mis_tracking_dpitch_mdeg > @s __mis_tracking_adjust_max_mdeg run scoreboard players operation @s mis_tracking_dpitch_mdeg = @s __mis_tracking_adjust_max_mdeg

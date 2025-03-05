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

scoreboard players set @s __mis_tracking_dyaw_mdeg 0
scoreboard players set @s __mis_tracking_dpitch_mdeg 0

# If t_missile_init_tracking is set, 
#   calculate minimum and maximum angles to apply tracking to
#   and find a tracking target if one is not yet provided
execute if entity @s[tag=t_missile_init_tracking] run function cashgrab:base/missile_tracking_init with entity @s data

# If no tracking target, do nothing
execute if score @s mis_tracking_target_eid matches 0 run return 0

# Search for tracking target and tag them with t_missile_tracking_target
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s mis_tracking_target_eid
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches,tag=!t_invisible,limit=1] add t_missile_tracking_target

# If tracking target doesn't exist or is invisible, erase tracking target EID
execute unless entity @e[tag=t_missile_tracking_target] run return run scoreboard players set @s mis_tracking_target_eid 0

# Calculate yaw and pitch of direction facing towards tracking target
execute facing entity @e[tag=t_missile_tracking_target,limit=1] eyes run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0f}
scoreboard players operation @s __mis_tracking_dyaw_mdeg = @s facing_vector_yaw_mdeg
scoreboard players operation @s __mis_tracking_dpitch_mdeg = @s facing_vector_pitch_mdeg

# Retrieve current yaw and pitch from nbt data
execute store result score @s facing_vector_yaw_mdeg run data get entity @s Rotation[0] 1000
execute store result score @s facing_vector_pitch_mdeg run data get entity @s Rotation[1] 1000

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_missile_physics_tracking:"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  facing_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"facing_vector_yaw_mdeg"}}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  goal_yaw_raw: "},{"type":"score","score":{"name":"@s","objective":"__mis_tracking_dyaw_mdeg"}}]

# =============================
# Yaw correction angle calculation

# __mis_tracking_dyaw_mdeg -= facing_vector_yaw_mdeg
scoreboard players operation @s __mis_tracking_dyaw_mdeg -= @s facing_vector_yaw_mdeg
#tellraw @a[tag=t_debug] [{"type":"text","text":"  yaw_diff: "},{"type":"score","score":{"name":"@s","objective":"__mis_tracking_dyaw_mdeg"}}]

# adjust difference if the distance across the angle circle's seam (where -180 is adjacent to 180) is shorter
scoreboard players add @s[scores={__mis_tracking_dyaw_mdeg=..-180000}] __mis_tracking_dyaw_mdeg 360000
scoreboard players remove @s[scores={__mis_tracking_dyaw_mdeg=180000..}] __mis_tracking_dyaw_mdeg 360000
#tellraw @a[tag=t_debug] [{"type":"text","text":"  yaw_diff_c: "},{"type":"score","score":{"name":"@s","objective":"__mis_tracking_dyaw_mdeg"}}]

# =============================
# Pitch correction angle calculation

# __mis_tracking_dpitch_mdeg -= facing_vector_pitch_mdeg
scoreboard players operation @s __mis_tracking_dpitch_mdeg -= @s facing_vector_pitch_mdeg

# =============================
# Post-processing

# Give up if target is further than give-up angle
execute if score @s __mis_tracking_dyaw_mdeg < @s __mis_tracking_giveup_min_mdeg run tag @s add t_give_up
execute if score @s __mis_tracking_dpitch_mdeg < @s __mis_tracking_giveup_min_mdeg run tag @s add t_give_up
execute if score @s __mis_tracking_dyaw_mdeg > @s __mis_tracking_giveup_max_mdeg run tag @s add t_give_up
execute if score @s __mis_tracking_dpitch_mdeg > @s __mis_tracking_giveup_max_mdeg run tag @s add t_give_up
scoreboard players set @s[tag=t_give_up] __mis_tracking_dyaw_mdeg 0
scoreboard players set @s[tag=t_give_up] __mis_tracking_dpitch_mdeg 0
tag @s remove t_give_up

# Cap tracking angle displacements 
execute if score @s __mis_tracking_dyaw_mdeg < @s __mis_tracking_adjust_min_mdeg run scoreboard players operation @s __mis_tracking_dyaw_mdeg = @s __mis_tracking_adjust_min_mdeg
execute if score @s __mis_tracking_dpitch_mdeg < @s __mis_tracking_adjust_min_mdeg run scoreboard players operation @s __mis_tracking_dpitch_mdeg = @s __mis_tracking_adjust_min_mdeg
execute if score @s __mis_tracking_dyaw_mdeg > @s __mis_tracking_adjust_max_mdeg run scoreboard players operation @s __mis_tracking_dyaw_mdeg = @s __mis_tracking_adjust_max_mdeg
execute if score @s __mis_tracking_dpitch_mdeg > @s __mis_tracking_adjust_max_mdeg run scoreboard players operation @s __mis_tracking_dpitch_mdeg = @s __mis_tracking_adjust_max_mdeg

# Clean up tags
tag @e remove t_missile_tracking_target

# base/missile_tracking_find_eid_npe.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#	facing: as the entity
#
# Summary: Calculates angle difference versus missile direction
#
# Arguments: (none)

# Calculate facing angle towards entity
execute at @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing entity @s eyes run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0}

tellraw @a[tag=t_debug] ["base/missile_tracking_find_eid_npe eid_self: ",{"score":{"name":"@s","objective":"eid_self"}}]

# ================================================
# Calculate dot product using facing vector data already on missile

scoreboard players set @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_sum_um 0

# x axis
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um = @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing_vector_x_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um *= @s facing_vector_x_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_sum_um += @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um

# y axis
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um = @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing_vector_y_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um *= @s facing_vector_y_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_sum_um += @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um

# z axis
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um = @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] facing_vector_z_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um *= @s facing_vector_z_mm
scoreboard players operation @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_sum_um += @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_term_um

# dot_product(a,b) = magnitude(a)*magnitude(b)*cos(angle) = cos(angle)
#   since magnitude(a)=magnitude(b)=1,
#   so larger dot products are more codirectional

tellraw @a[tag=t_debug] [" dp = ",{"score":{"name":"@e[tag=t_missile_tracking_calc_nearest_angle,limit=1]","objective":"__mis_tracking_nearest_angle_dp_sum_um"}}]

# ================================================
# If dot product is the newest largest, update EID target
execute as @e[tag=t_missile_tracking_calc_nearest_angle,limit=1] if score @s __mis_tracking_nearest_angle_dp_sum_um > @s __mis_tracking_nearest_angle_dp_max_um run tag @s add t_missile_tracking_update_nearest_angle

scoreboard players operation @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_max_um = @e[tag=t_missile_tracking_update_nearest_angle,limit=1] __mis_tracking_nearest_angle_dp_sum_um
scoreboard players operation @e[tag=t_missile_tracking_update_nearest_angle,limit=1] mis_tracking_target_eid = @s eid_self

execute if entity @e[tag=t_missile_tracking_update_nearest_angle] run tellraw @a[tag=t_debug] [{"color":"aqua","text":" Updating target EID, newest largest dp = "},{"score":{"name":"@e[tag=t_missile_tracking_calc_nearest_angle,limit=1]","objective":"__mis_tracking_nearest_angle_dp_max_um"}}]

# Clean up tags
tag @e[type=minecraft:marker] remove t_missile_tracking_update_nearest_angle


# util/npe_calc_facing_vector.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#	facing as: the direction to calculate the facing vector
#
# Summary: Calculates the x, y, z, of its facing direction vector and stores it onto facing_vector_x_mm, facing_vector_y_mm, and facing_vector_z_mm respectively
#
# Arguments:
#	magnitude				: Magnitude of vector

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_calc_facing_vector: Yaw: "},{"type":"nbt","source":"entity","nbt":"Rotation[0]","entity":"@s"},{"type":"text","text":" Pitch: "},{"type":"nbt","source":"entity","nbt":"Rotation[1]","entity":"@s"}]

# Place a marker at execution location and record its position
summon minecraft:marker ~ ~ ~ {Tags:["t_velcalc_from","t_velcalc_active"]}
execute as @e[tag=t_velcalc_from,tag=t_velcalc_active,limit=1] at @s run function cashgrab:util/npe_record_position

# Place a marker ahead of execution location by magntiude and record its position
$summon minecraft:marker ^ ^ ^$(magnitude) {Tags:["t_velcalc_to","t_velcalc_active"]}
$execute positioned ^ ^ ^$(magnitude) run tp @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] ~ ~ ~ facing ^ ^ ^1
execute as @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] at @s run function cashgrab:util/npe_record_position

# Set this.facing_vector = t_velcalc_to.pos
scoreboard players operation @s facing_vector_x_mm = @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] pos_x_mm
scoreboard players operation @s facing_vector_y_mm = @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] pos_y_mm
scoreboard players operation @s facing_vector_z_mm = @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] pos_z_mm

# Then set this.facing_vector = t_velcalc_to.pos - t_velcalc_from.pos
scoreboard players operation @s facing_vector_x_mm -= @e[tag=t_velcalc_from,tag=t_velcalc_active,limit=1] pos_x_mm
scoreboard players operation @s facing_vector_y_mm -= @e[tag=t_velcalc_from,tag=t_velcalc_active,limit=1] pos_y_mm
scoreboard players operation @s facing_vector_z_mm -= @e[tag=t_velcalc_from,tag=t_velcalc_active,limit=1] pos_z_mm

# Record facing yaw and pitch
execute store result score @s facing_vector_yaw_mdeg run data get entity @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] Rotation[0] 1000
execute store result score @s facing_vector_pitch_mdeg run data get entity @e[tag=t_velcalc_to,tag=t_velcalc_active,limit=1] Rotation[1] 1000

tag @e[tag=t_velcalc_active] remove t_velcalc_active
kill @e[tag=t_velcalc_from]
kill @e[tag=t_velcalc_to]

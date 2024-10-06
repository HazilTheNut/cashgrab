# util/npe_calc_facing_vector.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#	facing: as the entity
#
# Summary: Calculates the x, y, z, of its facing direction vector and stores it onto facing_vector_x_mm, facing_vector_y_mm, and facing_vector_z_mm respectively
#			This "base velocity" has the effect of gravity added onto it to achieve the missile's velocity vector per tick
#
# Arguments:
#	magnitude				: Magnitude of vector

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_calc_facing_vector: Yaw: "},{"type":"nbt","source":"entity","nbt":"Rotation[0]","entity":"@s"},{"type":"text","text":" Pitch: "},{"type":"nbt","source":"entity","nbt":"Rotation[1]","entity":"@s"}]

# Record missile's position
function cashgrab:util/npe_record_position

# Record position immediately ahead of missile (scaled by magnitude arg)
$summon minecraft:marker ^ ^ ^$(magnitude) {Tags:["t_velcalc","t_velcalc_active"]}
$execute positioned ^ ^ ^$(magnitude) run tp @e[tag=t_velcalc_active,limit=1] ~ ~ ~ facing ^ ^ ^1
execute as @e[tag=t_velcalc_active,limit=1] at @s run function cashgrab:util/npe_record_position

# Set this.facing_vector = t_velcalc.pos
scoreboard players operation @s facing_vector_x_mm = @e[tag=t_velcalc_active,limit=1] pos_x_mm
scoreboard players operation @s facing_vector_y_mm = @e[tag=t_velcalc_active,limit=1] pos_y_mm
scoreboard players operation @s facing_vector_z_mm = @e[tag=t_velcalc_active,limit=1] pos_z_mm

# Then set this.facing_vector = t_velcalc.pos - this.pos
scoreboard players operation @s facing_vector_x_mm -= @s pos_x_mm
scoreboard players operation @s facing_vector_y_mm -= @s pos_y_mm
scoreboard players operation @s facing_vector_z_mm -= @s pos_z_mm

# Record facing yaw and pitch
execute store result score @s facing_vector_yaw_mdeg run data get entity @e[tag=t_velcalc_active,limit=1] Rotation[0] 1000
execute store result score @s facing_vector_pitch_mdeg run data get entity @e[tag=t_velcalc_active,limit=1] Rotation[1] 1000

tag @e[tag=t_velcalc_active] remove t_velcalc_active
kill @e[tag=t_velcalc]
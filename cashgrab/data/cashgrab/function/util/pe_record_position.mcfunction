# util/pe_record_position.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Copies its x, y, z position to pos_x_mm, pos_y_mm, and pos_z_mm
#
# Arguments: (none)

execute store result score @s pos_x_mm run data get entity @s Pos[0] 1000
execute store result score @s pos_y_mm run data get entity @s Pos[1] 1000
execute store result score @s pos_z_mm run data get entity @s Pos[2] 1000

#tellraw @a[tag=t_debug] [{"type":"text","text":"pe_record_position: Yaw: "},{"type":"nbt","source":"entity","nbt":"Rotation[0]","entity":"@s"},{"type":"text","text":" Pitch: "},{"type":"nbt","source":"entity","nbt":"Rotation[1]","entity":"@s"}]

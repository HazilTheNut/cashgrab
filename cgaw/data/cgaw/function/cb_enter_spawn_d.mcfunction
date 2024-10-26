# Arguments:
#	loc_spawn_d		: Spawn D location
#	rot_spawn_d		: Spawn D rotation

tag @p add m_send_to_map

# Set player activity_state
scoreboard players set @p[tag=m_send_to_map] activity_state 20

# Teleport player
$tp @p[tag=m_send_to_map] $(loc_spawn_d) $(rot_spawn_d)

tag @a remove m_send_to_map

# Set cooldown for spawn plate
setblock ~ ~ ~ minecraft:air
setblock ~ ~-1 ~ minecraft:polished_blackstone
scoreboard players operation CGAW_SPAWN_CD_D_TICKS num = CGAW_SPAWN_PLATE_CD_TICKS num


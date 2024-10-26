# Arguments:
#	loc_spawn_a		: Spawn A location
#	rot_spawn_a		: Spawn A rotation

tag @p add m_send_to_map

# Set player activity_state
scoreboard players set @p[tag=m_send_to_map] activity_state 20

# Teleport player
$tp @p[tag=m_send_to_map] $(loc_spawn_a) $(rot_spawn_a)


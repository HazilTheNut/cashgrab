# Arguments:
#	loc_spawn_d		: Spawn D location
#	rot_spawn_d		: Spawn D rotation

tag @p add m_send_to_map

# Set player activity_state
scoreboard players set @p[tag=m_send_to_map] activity_state 20

# Teleport player
$tp @p[tag=m_send_to_map] $(loc_spawn_d) $(rot_spawn_d)


# Arguments:
#	loc_lobby		:	Teleport coordinates to Lobby
#	yaw_lobby		:	Teleport yaw rotation for Lobby

$tellraw @a[tag=t_debug,tag=dtm_send_to_lobby] "Teleporting you to $(loc_lobby) $(yaw_lobby)"

# Teleport players to Lobby
$tp @a[tag=dtm_send_to_lobby] $(loc_lobby) $(yaw_lobby) 0

# Remove tag from players at Lobby
$execute positioned $(loc_lobby) run tag @a[tag=dtm_send_to_lobby,distance=..3] remove dtm_send_to_lobby

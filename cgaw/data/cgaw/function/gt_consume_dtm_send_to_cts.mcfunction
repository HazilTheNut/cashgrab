# Arguments:
#	loc_cts		:	Teleport coordinates to CTS room
#	yaw_cts		:	Teleport yaw rotation for CTS room

$tellraw @a[tag=t_debug,tag=dtm_send_to_cts] "Teleporting you to $(loc_cts) $(yaw_cts)"

# Teleport players to CTS room
$tp @a[tag=dtm_send_to_cts] $(loc_cts) $(yaw_cts) 0

# Remove tag from players at cts room
$execute positioned $(loc_cts) run tag @a[tag=dtm_send_to_cts,distance=..3] remove dtm_send_to_cts

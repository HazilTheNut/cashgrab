# Arguments:
#	loc		:	Teleport coordinates to Lobby
#	yaw		:	Teleport yaw rotation for Lobby

$tellraw @a[tag=t_debug,tag=t_pm_owner,limit=1] "Teleporting you to $(loc) $(yaw)"

# Teleport players to Lobby
$tp @a[tag=t_pm_owner,limit=1] $(loc) $(yaw) 0

# Set spawnpoint
$spawnpoint @a[tag=t_pm_owner,limit=1] $(loc) $(yaw)

# Remove tag from players at Lobby
$execute positioned $(loc) run tag @a[tag=t_pm_owner,limit=1,distance=..3] remove dtm_send_to_tutorial

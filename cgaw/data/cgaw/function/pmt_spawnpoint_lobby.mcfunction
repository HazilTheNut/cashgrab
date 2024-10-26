# Arguments:
#	loc_lobby		:	Teleport coordinates to Lobby
#	yaw_lobby		:	Teleport yaw rotation for Lobby

$tellraw @a[tag=t_debug,tag=t_pm_owner,limit=1] "Setting spawnpoint to $(loc_lobby) $(yaw_lobby)"

# Set spawnpoint
$spawnpoint @a[tag=t_pm_owner,limit=1] $(loc_cts) $(yaw_lobby)
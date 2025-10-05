# Arguments:
#	loc_cts		:	Teleport coordinates to CTS room
#	yaw_cts		:	Teleport coordinates to CTS room

$tellraw @a[tag=t_debug,tag=t_pm_owner,limit=1] "Setting spawnpoint to $(loc_cts) $(yaw_cts)"

# Set spawnpoint
$spawnpoint @a[tag=t_pm_owner,limit=1] $(loc_cts) $(yaw_cts) 0

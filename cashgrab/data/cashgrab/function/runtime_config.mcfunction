# runtime_config.mcfunction
#
# Context: None
#
# Summary: Ends an active game
#
# Arguments: (none)

# Setting DEVELOPER_MODE to 1 does the following:
#	-	Enables test classes and trinkets
#	-	Prevents player activity_state values from being written to by the datapack
#	-	Tags used to teleport players to lobby/respawn room are not issued
#	-	Scoreboard display is not updated
scoreboard players set DEVELOPER_MODE num 1

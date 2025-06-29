# runtime_config.mcfunction
#
# Context: None
#
# Summary: Sets runtime configuration of cashgrab to be ran every tick. 
#			This is done so even if players have command permissions, they
#			could not reconfigure the below parameters
#
# Arguments: (none)

# Setting DEVELOPER_MODE to 1 does the following:
#	-	Enables test classes and trinkets
#	-	Prevents player activity_state values from being written to by the datapack
#	-	Tags used to teleport players to lobby/respawn room are not issued
#	-	Scoreboard display is not updated
scoreboard players set DEVELOPER_MODE num 0

# Enables coin spilling mechanics.
#	While enabled, players at or above 90% of the goal number of coins
#	will continually drop coins.
#	This is intended to push players near the goal number to fight
#	other players to finish the game.
scoreboard players set ENABLE_COIN_SPILLING num 1

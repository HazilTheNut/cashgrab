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

# Setting ENABLE_PLUGINS to 0 causes #cashgrab:gt_load_post, #cashgrab:gt_tick_post, 
#	#cashgrab:gt_tick_prior, #cashgrab:pm_tick_post, #cashgrab:pm_tick_prior,
#	#cashgrab:gt_game_end, and #cashgrab:gt_game_start to not run,
#	effectively preventing other plugins from significantly altering cashgrab's behavior.
scoreboard players set ENABLE_PLUGINS num 1

# end_game.mcfunction
#
# Context: None
#
# Summary: Ends an active game
#
# Arguments: (none)

execute if score NUM_GAMESTATE num matches 0 run return 0

# Clean up subordinates of all players
execute as @e[tag=t_pm] run function cashgrab:base/pm_cleanup_player_subs

# Reset all coin plates, destroy all coin showers and dropped coins
execute as @e[tag=t_coinplate_cooldown] at @s run setblock ~ ~ ~ minecraft:light_weighted_pressure_plate
kill @e[tag=t_coinplate_cooldown]
kill @e[type=minecraft:item]
kill @e[tag=t_coinshower]

# Reset player data and return them to the lobby
scoreboard players set @a coins 0
execute if score DEVELOPER_MODE num matches 0 run scoreboard players set @a activity_state 0
execute if score DEVELOPER_MODE num matches 0 run scoreboard players set @a team_id 0
execute if score DEVELOPER_MODE num matches 0 run tag @a add dtm_send_to_lobby

# Allow plugins to run code when game ends
execute if score ENABLE_PLUGINS num matches 1.. run function #cashgrab:gt_game_end

scoreboard players set NUM_GAMESTATE num 0

# start_game.mcfunction
#
# Context: None
#
# Summary: Starts a game
#
# Arguments: (none)

execute if score NUM_GAMESTATE num matches 1.. run return 0

# Reset player data and return them to the lobby
scoreboard players set @a coins 0
execute if score DEVELOPER_MODE num matches 0 run scoreboard players set @a activity_state 10
execute if score DEVELOPER_MODE num matches 0 run tag @a add dtm_send_to_cts

# Redraw coin sidebar display
function cashgrab:base/gt_display_coin_score

# Allow plugins to run code when game ends
function #cashgrab:gt_game_start

scoreboard players set NUM_GAMESTATE num 1

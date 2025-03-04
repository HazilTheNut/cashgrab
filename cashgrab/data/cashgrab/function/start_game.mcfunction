# start_game.mcfunction
#
# Context: None
#
# Summary: Starts a game
#
# Arguments: (none)

execute if score NUM_GAMESTATE num matches 1.. run return 0

# Reset player data and return them to the lobby
scoreboard players set @a[scores={activity_state=..29}] coins 0
execute if score DEVELOPER_MODE num matches 0 run scoreboard players set @a[scores={activity_state=..29}] activity_state 10
execute if score DEVELOPER_MODE num matches 0 run tag @a[scores={activity_state=..29}] add dtm_send_to_cts

# Redraw coin sidebar display
function cashgrab:base/gt_display_coin_score

# Calculate coin spilling threshold
execute store result storage cashgrab:coin_spill_threshold value int 0.9 run scoreboard players get GOAL coins
execute store result score NUM_COIN_SPILLING_THRESHOLD num run data get storage cashgrab:coin_spill_threshold value 1

# Display chat message
tellraw @a [{"type":"text","color":"aqua","text":"\nThe game has begun!\n","underlined":true},{"type":"text","color":"gold","underlined":false,"text":"You can select your class and trinket in your inventory between respawns\n"}]

# Allow plugins to run code when game ends
function #cashgrab:gt_game_start

scoreboard players set NUM_GAMESTATE num 1

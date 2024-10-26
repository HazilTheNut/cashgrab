
# Lobby behavior
execute if score NUM_GAMESTATE num matches 0 run function cgaw:gt_tick_post_lobby

# Afterwards, clear player input
scoreboard players reset @a[scores={cgaw_selected_map_id_input=1..}] cgaw_selected_map_id_input

scoreboard players reset @a[scores={cgaw_change_coin_goal_input=1..}] cgaw_change_coin_goal_input
scoreboard players reset @a[scores={cgaw_change_coin_goal_input=..-1}] cgaw_change_coin_goal_input
scoreboard players reset @a[scores={cgaw_reset_coin_goal_input=1..}] cgaw_reset_coin_goal_input

scoreboard players reset @a[scores={cgaw_change_match_time_input=1..}] cgaw_change_match_time_input
scoreboard players reset @a[scores={cgaw_change_match_time_input=..-1}] cgaw_change_match_time_input
scoreboard players reset @a[scores={cgaw_reset_match_time_input=1..}] cgaw_reset_match_time_input


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

# Handle dtm_send_to_lobby tag
execute if entity @a[tag=dtm_send_to_lobby] run function cgaw:gt_consume_dtm_send_to_lobby with storage cgaw:world_info lobby_data

# Handle dtm_send_to_cts tag
execute if entity @a[tag=dtm_send_to_cts] run function cgaw:gt_consume_dtm_send_to_cts with storage cgaw:runtime active_map

# If during gameplay, decrement spawn plate cooldown timers
execute if score NUM_GAMESTATE num matches 1.. if score CGAW_SPAWN_CD_A_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_A_TICKS num 1
execute if score NUM_GAMESTATE num matches 1.. if score CGAW_SPAWN_CD_B_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_B_TICKS num 1
execute if score NUM_GAMESTATE num matches 1.. if score CGAW_SPAWN_CD_C_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_C_TICKS num 1
execute if score NUM_GAMESTATE num matches 1.. if score CGAW_SPAWN_CD_D_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_D_TICKS num 1

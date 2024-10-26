
# --- Lobby map selection

# Enable map id selection when game is inactive
scoreboard players enable @a cgaw_selected_map_id_input

# If a player triggers cgaw_selected_map_id_input, set map id if game is inactive
execute if entity @a[scores={cgaw_selected_map_id_input=1..}] run scoreboard players operation CGAW_CFG_MAP_ID num = @a[scores={cgaw_selected_map_id_input=1..},limit=1] cgaw_selected_map_id_input
execute if entity @a[scores={cgaw_selected_map_id_input=1..}] run function cgaw:gt_populate_lobby

# --- Lobby coin goal modification

# Enable coin goal configuration when game is inactive
scoreboard players enable @a cgaw_change_coin_goal_input
scoreboard players enable @a cgaw_reset_coin_goal_input

# If a player triggers cgaw_change_coin_goal_input, modify coin goal
execute if entity @a[scores={cgaw_change_coin_goal_input=1..}] run scoreboard players operation GOAL coins += @a[scores={cgaw_change_coin_goal_input=1..},limit=1] cgaw_change_coin_goal_input
execute if entity @a[scores={cgaw_change_coin_goal_input=..-1}] run scoreboard players operation GOAL coins += @a[scores={cgaw_change_coin_goal_input=..-1},limit=1] cgaw_change_coin_goal_input
execute if entity @a[scores={cgaw_change_coin_goal_input=..-1}] if score GOAL coins matches ..9 run scoreboard players set GOAL coins 10

# If a player triggers cgaw_reset_coin_goal_input, set coin goal to default
execute if entity @a[scores={cgaw_reset_coin_goal_input=1..}] run scoreboard players set GOAL coins 100

# --- Lobby match time modification

# Enable match time configuration when game is inactive
scoreboard players enable @a cgaw_change_match_time_input
scoreboard players enable @a cgaw_reset_match_time_input

# If a player triggers cgaw_change_match_time_input, modify match time
execute if entity @a[scores={cgaw_change_match_time_input=1..}] run scoreboard players operation CGAW_CFG_MATCH_TIME_TICKS num += @a[scores={cgaw_change_match_time_input=1..},limit=1] cgaw_change_match_time_input
execute if entity @a[scores={cgaw_change_match_time_input=..-1}] run scoreboard players operation CGAW_CFG_MATCH_TIME_TICKS num += @a[scores={cgaw_change_match_time_input=..-1},limit=1] cgaw_change_match_time_input
execute if entity @a[scores={cgaw_change_match_time_input=..-1}] if score CGAW_CFG_MATCH_TIME_TICKS num matches ..5999 run scoreboard players set CGAW_CFG_MATCH_TIME_TICKS num 6000

# If a player triggers cgaw_reset_match_time_input, set match time to default
execute if entity @a[scores={cgaw_reset_match_time_input=1..}] run scoreboard players set CGAW_CFG_MATCH_TIME_TICKS num 18000

# Display new match time
execute if entity @a[scores={cgaw_change_match_time_input=..-1}] run function cgaw:gt_display_cfg_match_time
execute if entity @a[scores={cgaw_change_match_time_input=1..}] run function cgaw:gt_display_cfg_match_time
execute if entity @a[scores={cgaw_reset_match_time_input=1..}] run function cgaw:gt_display_cfg_match_time


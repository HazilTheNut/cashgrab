
# Reset cooldowns on spawn select plates
scoreboard players set CGAW_SPAWN_CD_A_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_B_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_C_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_D_TICKS num 10

# Load map data
function cgaw:dynamic/gt_load_active_map

# Set time of day
function cgaw:gt_set_daytime with storage cgaw:runtime active_map

# Set match timer
execute if score DEVELOPER_MODE num matches 0 run scoreboard players operation CGAW_MATCH_TIME_TICKS num = CGAW_CFG_MATCH_TIME_TICKS num

# Reset configuration triggers
scoreboard players reset @a cgaw_selected_map_id_input
scoreboard players reset @a cgaw_change_coin_goal_input
scoreboard players reset @a cgaw_reset_coin_goal_input
scoreboard players reset @a cgaw_change_match_time_input
scoreboard players reset @a cgaw_reset_match_time_input

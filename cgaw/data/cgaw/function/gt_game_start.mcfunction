
# Reset cooldowns on spawn select plates
scoreboard players set CGAW_SPAWN_CD_A_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_B_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_C_TICKS num 10
scoreboard players set CGAW_SPAWN_CD_D_TICKS num 10

# Load map data
execute if score CGAW_CFG_MAP_ID num matches 101 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.fissure
execute if score CGAW_CFG_MAP_ID num matches 102 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.crystal
execute if score CGAW_CFG_MAP_ID num matches 103 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.sunken

execute if score CGAW_CFG_MAP_ID num matches 201 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.scald
execute if score CGAW_CFG_MAP_ID num matches 202 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.golden

execute if score CGAW_CFG_MAP_ID num matches 301 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.deepgrove
execute if score CGAW_CFG_MAP_ID num matches 302 run data modify storage cgaw:runtime active_map set from storage cgaw:world_info map_data.skullway

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

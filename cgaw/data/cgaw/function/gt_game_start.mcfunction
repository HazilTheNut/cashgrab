
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

# Set match timer
scoreboard players operation CGAW_MATCH_TIME_TICKS num = CGAW_CFG_MATCH_TIME_TICKS num
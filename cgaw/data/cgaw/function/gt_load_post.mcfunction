
# Create scoreboard objectives / globals

# --- Lobby / game config

# Selected map
scoreboard players add CGAW_CFG_MAP_ID num 0
scoreboard objectives add cgaw_selected_map_id_input trigger

# Coin goal config
scoreboard objectives add cgaw_change_coin_goal_input trigger
scoreboard objectives add cgaw_reset_coin_goal_input trigger

# Match time config
scoreboard players add CGAW_CFG_MATCH_TIME_TICKS num 0
scoreboard objectives add cgaw_change_match_time_input trigger
scoreboard objectives add cgaw_reset_match_time_input trigger

scoreboard players set NUM_TICKS_PER_MIN num 1200
scoreboard players add CGAW_CFG_MATCH_TIME_DISPLAY_MIN num 0

# --- CTS Room

# Spawn plate cooldowns
scoreboard players set CGAW_SPAWN_CD_A num 1
scoreboard players set CGAW_SPAWN_CD_B num 1
scoreboard players set CGAW_SPAWN_CD_C num 1
scoreboard players set CGAW_SPAWN_CD_D num 1

# Define lobby location

data modify storage cgaw:world_info lobby_data set value {loc_lobby:"18 -18 43",yaw_lobby:"0"}

# Create map data structure

data modify storage cgaw:world_info map_data set value {\
fissure:{\
size:1,\
map_name:"Fissure",\
loc_cts:"1131 95 -2998",\
yaw_cts:"-90",\
loc_spawn_a:"1198 106 -3028",\
rot_spawn_a:"-45 0",\
loc_spawn_b:"1209 95 -2958",\
rot_spawn_b:"-155 0",\
loc_spawn_c:"1183 129 -2977",\
rot_spawn_c:"180 0",\
loc_spawn_d:"1169 113 -3013",\
rot_spawn_d:"0 0",\
},\
crystal:{\
size:1,\
map_name:"Crystal",\
loc_cts:"1047 93 -1998",\
yaw_cts:"-90",\
loc_spawn_a:"1114 128 -2002",\
rot_spawn_a:"90 0",\
loc_spawn_b:"1119 89 -1987",\
rot_spawn_b:"150 -15",\
loc_spawn_c:"1082 95 -1970",\
rot_spawn_c:"-90 0",\
loc_spawn_d:"1114 94 -2028",\
rot_spawn_d:"90 0",\
},\
sunken:{\
size:1,\
map_name:"Sunken",\
loc_cts:"",\
yaw_cts:"-90",\
loc_spawn_a:"",\
rot_spawn_a:"",\
loc_spawn_b:"",\
rot_spawn_b:"",\
loc_spawn_c:"",\
rot_spawn_c:"",\
loc_spawn_d:"",\
rot_spawn_d:"",\
},\
scald:{\
size:2,\
map_name:"Scald",\
loc_cts:"",\
yaw_cts:"-90",\
loc_spawn_a:"",\
rot_spawn_a:"",\
loc_spawn_b:"",\
rot_spawn_b:"",\
loc_spawn_c:"",\
rot_spawn_c:"",\
loc_spawn_d:"",\
rot_spawn_d:"",\
},\
golden:{\
size:2,\
map_name:"Golden",\
loc_cts:"",\
yaw_cts:"-90",\
loc_spawn_a:"",\
rot_spawn_a:"",\
loc_spawn_b:"",\
rot_spawn_b:"",\
loc_spawn_c:"",\
rot_spawn_c:"",\
loc_spawn_d:"",\
rot_spawn_d:"",\
},\
deepgrove:{\
size:3,\
map_name:"Deepgrove",\
loc_cts:"",\
yaw_cts:"-90",\
loc_spawn_a:"",\
rot_spawn_a:"",\
loc_spawn_b:"",\
rot_spawn_b:"",\
loc_spawn_c:"",\
rot_spawn_c:"",\
loc_spawn_d:"",\
rot_spawn_d:"",\
},\
skullway:{\
size:3,\
map_name:"Skullway",\
loc_cts:"",\
yaw_cts:"-90",\
loc_spawn_a:"",\
rot_spawn_a:"",\
loc_spawn_b:"",\
rot_spawn_b:"",\
loc_spawn_c:"",\
rot_spawn_c:"",\
loc_spawn_d:"",\
rot_spawn_d:"",\
},\
}


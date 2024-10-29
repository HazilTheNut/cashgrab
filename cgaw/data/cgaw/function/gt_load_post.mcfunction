
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

scoreboard players add CGAW_MATCH_TIME_TICKS num 0
execute if score CGAW_MATCH_TIME_TICKS num matches 0 run scoreboard players set CGAW_MATCH_TIME_TICKS num 6000

# --- CTS Room

# Spawn plate cooldowns
scoreboard players add CGAW_SPAWN_CD_A_TICKS num 0
scoreboard players add CGAW_SPAWN_CD_B_TICKS num 0
scoreboard players add CGAW_SPAWN_CD_C_TICKS num 0
scoreboard players add CGAW_SPAWN_CD_D_TICKS num 0

scoreboard players set CGAW_SPAWN_PLATE_CD_TICKS num 100

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
loc_cts:"1040 93 -1000",\
yaw_cts:"-90",\
loc_spawn_a:"1066 98 -988",\
rot_spawn_a:"-35 15",\
loc_spawn_b:"1079 91 -1015",\
rot_spawn_b:"-90 0",\
loc_spawn_c:"1132 98 -1015",\
rot_spawn_c:"0 0",\
loc_spawn_d:"1113 94 -993",\
rot_spawn_d:"180 0",\
},\
scald:{\
size:2,\
map_name:"Scald",\
loc_cts:"1035 96 0",\
yaw_cts:"-90",\
loc_spawn_a:"1091 100 2",\
rot_spawn_a:"-90 0",\
loc_spawn_b:"1105 88 5",\
rot_spawn_b:"-145 -5",\
loc_spawn_c:"1077 101 26",\
rot_spawn_c:"-135 0",\
loc_spawn_d:"1138 110 30",\
rot_spawn_d:"90 0",\
},\
golden:{\
size:2,\
map_name:"Golden",\
loc_cts:"1054 94 2000",\
yaw_cts:"-90",\
loc_spawn_a:"1102 107 1957",\
rot_spawn_a:"-90 0",\
loc_spawn_b:"1112 105 2032",\
rot_spawn_b:"90 0",\
loc_spawn_c:"1153 101 1999",\
rot_spawn_c:"50 0",\
loc_spawn_d:"1171 123 2016",\
rot_spawn_d:"-180 -15",\
},\
deepgrove:{\
size:3,\
map_name:"Deepgrove",\
loc_cts:"1027 95 1000",\
yaw_cts:"-90",\
loc_spawn_a:"1080 110 984",\
rot_spawn_a:"45 0",\
loc_spawn_b:"1058 96 1027",\
rot_spawn_b:"-128 0",\
loc_spawn_c:"1098 88 1067",\
rot_spawn_c:"-90 0",\
loc_spawn_d:"1157 85 1021",\
rot_spawn_d:"130 0",\
},\
skullway:{\
size:3,\
map_name:"Skullway",\
loc_cts:"1031 95 3000",\
yaw_cts:"-90",\
loc_spawn_a:"1080 102 2960",\
rot_spawn_a:"-60 0",\
loc_spawn_b:"1140 98 2958",\
rot_spawn_b:"45 0",\
loc_spawn_c:"1125 109 3042",\
rot_spawn_c:"0 0",\
loc_spawn_d:"1073 92 3044",\
rot_spawn_d:"-90 0",\
},\
}


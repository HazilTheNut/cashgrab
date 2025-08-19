
# --- Map selection backdrop
fill 28 -18 57 28 -17 59 minecraft:polished_blackstone
fill 28 -18 63 28 -17 65 minecraft:polished_blackstone
fill 28 -18 69 28 -17 71 minecraft:polished_blackstone

# Place gold block behind selected map
execute if score CGAW_CFG_MAP_ID num matches 101 run setblock 28 -18 57 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 102 run setblock 28 -18 58 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 103 run setblock 28 -18 59 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 104 run setblock 28 -17 57 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 105 run setblock 28 -17 58 minecraft:gold_block

execute if score CGAW_CFG_MAP_ID num matches 201 run setblock 28 -18 63 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 202 run setblock 28 -18 64 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 203 run setblock 28 -18 65 minecraft:gold_block

execute if score CGAW_CFG_MAP_ID num matches 301 run setblock 28 -18 69 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 302 run setblock 28 -18 70 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 303 run setblock 28 -18 71 minecraft:gold_block

# --- Map selection signs

# Fissure
setblock 27 -18 57 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Fissure]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 101"}},\
"",\
""\
]}} replace

# Crystal
setblock 27 -18 58 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Crystal]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 102"}},\
"",\
""\
]}} replace

# Sunken
setblock 27 -18 59 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Sunken]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 103"}},\
"",\
""\
]}} replace

# Dustworks
setblock 27 -17 57 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Dustworks]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 104"}},\
"",\
""\
]}} replace

# Polaris
setblock 27 -17 58 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Polaris]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 105"}},\
"",\
""\
]}} replace

# Scald
setblock 27 -18 63 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Scald]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 201"}},\
"",\
""\
]}} replace

# Golden
setblock 27 -18 64 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Golden]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 202"}},\
"",\
""\
]}} replace

# Bogpit
setblock 27 -18 65 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Bogpit]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 203"}},\
"",\
""\
]}} replace

# Deepgrove
setblock 27 -18 69 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Deepgrove]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 301"}},\
"",\
""\
]}} replace

# Skullway
setblock 27 -18 70 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Skullway]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 302"}},\
"",\
""\
]}} replace

# Graphite
setblock 27 -18 71 minecraft:bamboo_wall_sign[facing=west]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[Graphite]",click_event:{action:"run_command",command:"/trigger cgaw_selected_map_id_input set 303"}},\
"",\
""\
]}} replace

# --- Coin goal config signs

# -25 Coins
setblock 23 -17 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[-25 Coins]",click_event:{action:"run_command",command:"/trigger cgaw_change_coin_goal_input set -25"}},\
"",\
""\
]}} replace

# -10 Coins
setblock 23 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[-10 Coins]",click_event:{action:"run_command",command:"/trigger cgaw_change_coin_goal_input set -10"}},\
"",\
""\
]}} replace

# Default
setblock 22 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[100 Coins]",click_event:{action:"run_command",command:"/trigger cgaw_reset_coin_goal_input set 1"}},\
"",\
""\
]}} replace


# +10 Coins
setblock 21 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[+10 Coins]",click_event:{action:"run_command",command:"/trigger cgaw_change_coin_goal_input set 10"}},\
"",\
""\
]}} replace

# +25 Coins
setblock 21 -17 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text",text:"[+25 Coins]",click_event:{action:"run_command",command:"/trigger cgaw_change_coin_goal_input set 25"}},\
"",\
""\
]}} replace

# --- Match time config signs

# -5 Minutes
setblock 15 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text","text":"[-5 Min]",click_event:{action:"run_command",command:"/trigger cgaw_change_match_time_input set -6000"}},\
"",\
""\
]}} replace

# Default
setblock 14 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text","text":"[15 Min]",click_event:{action:"run_command",command:"/trigger cgaw_reset_match_time_input set 1"}},\
"",\
""\
]}} replace

# +5 Minutes
setblock 13 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
"",\
{type:"text","text":"[+5 Min]",click_event:{action:"run_command",command:"/trigger cgaw_change_match_time_input set 6000"}},\
"",\
""\
]}} replace

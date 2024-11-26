
# --- Map selection backdrop
function cgaw:dynamic/gt_populate_lobby_map_backdrops

# --- Map selection signs
function cgaw:dynamic/gt_populate_lobby_map_signs

# --- Coin goal config signs

# -25 Coins
setblock 23 -17 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[-25 Coins]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_coin_goal_input set -25"}}',\
'""',\
'""'\
]}} replace

# -10 Coins
setblock 23 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[-10 Coins]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_coin_goal_input set -10"}}',\
'""',\
'""'\
]}} replace

# Default
setblock 22 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[100 Coins]","clickEvent":{"action":"run_command","value":"trigger cgaw_reset_coin_goal_input set 1"}}',\
'""',\
'""'\
]}} replace


# +10 Coins
setblock 21 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[+10 Coins]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_coin_goal_input set 10"}}',\
'""',\
'""'\
]}} replace

# +25 Coins
setblock 21 -17 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[+25 Coins]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_coin_goal_input set 25"}}',\
'""',\
'""'\
]}} replace

# --- Match time config signs

# -5 Minutes
setblock 15 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[-5 Min]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_match_time_input set -6000"}}',\
'""',\
'""'\
]}} replace

# Default
setblock 14 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[15 Min]","clickEvent":{"action":"run_command","value":"trigger cgaw_reset_match_time_input set 1"}}',\
'""',\
'""'\
]}} replace

# +5 Minutes
setblock 13 -18 75 minecraft:bamboo_wall_sign[facing=north]{is_waxed:1b,front_text:{messages:[\
'""',\
'{"type":"text","text":"[+5 Min]","clickEvent":{"action":"run_command","value":"trigger cgaw_change_match_time_input set 6000"}}',\
'""',\
'""'\
]}} replace

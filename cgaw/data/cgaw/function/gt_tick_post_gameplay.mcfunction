
# Decrement spawn plate cooldown timers
execute if score CGAW_SPAWN_CD_A_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_A_TICKS num 1
execute if score CGAW_SPAWN_CD_B_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_B_TICKS num 1
execute if score CGAW_SPAWN_CD_C_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_C_TICKS num 1
execute if score CGAW_SPAWN_CD_D_TICKS num matches 1.. run scoreboard players remove CGAW_SPAWN_CD_D_TICKS num 1

# Tick down game timer
execute if score DEVELOPER_MODE num matches 0 if score CGAW_MATCH_TIME_TICKS num matches 1.. run scoreboard players remove CGAW_MATCH_TIME_TICKS num 1

# Make announcements at various time amounts remaining
execute if score CGAW_MATCH_TIME_TICKS num matches 12000 run tellraw @a [{"type":"text","color":"yellow","text":"10"},{"type":"text","color":"aqua","text":" minutes remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 6000 run tellraw @a [{"type":"text","color":"yellow","text":"5"},{"type":"text","color":"aqua","text":" minutes remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 3600 run tellraw @a [{"type":"text","color":"yellow","text":"3"},{"type":"text","color":"aqua","text":" minutes remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 2400 run tellraw @a [{"type":"text","color":"yellow","text":"2"},{"type":"text","color":"aqua","text":" minutes remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 1200 run tellraw @a [{"type":"text","color":"yellow","text":"1"},{"type":"text","color":"aqua","text":" minute remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 600 run tellraw @a [{"type":"text","color":"red","text":"30"},{"type":"text","color":"aqua","text":" seconds remaining!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 200 run tellraw @a [{"type":"text","color":"red","text":"10"},{"type":"text","color":"aqua","text":" seconds remaining!"}]

# Game time out
execute if score CGAW_MATCH_TIME_TICKS num matches 1 run tellraw @a [{"type":"text","color":"aqua","text":"Game has timed out!"}]
execute if score CGAW_MATCH_TIME_TICKS num matches 1 run function cashgrab:end_game

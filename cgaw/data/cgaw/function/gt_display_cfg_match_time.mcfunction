
# Calculate match time in minutes
scoreboard players operation CGAW_CFG_MATCH_TIME_DISPLAY_MIN num = CGAW_CFG_MATCH_TIME_TICKS num
scoreboard players operation CGAW_CFG_MATCH_TIME_DISPLAY_MIN num /= NUM_TICKS_PER_MIN num

tellraw @a [{"type":"text","color":"green","text":"Match time set to "},{"type":"score","color":"yellow","score":{"name":"CGAW_CFG_MATCH_TIME_DISPLAY_MIN","objective":"num"}},{"type":"text","color":"yellow","text":" minutes"}]

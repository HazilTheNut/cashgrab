# base/gt_display_coin_score.mcfunction
#
# Context: Global tick
#
# Summary: Handles game scoring mechanics
#
# Arguments: (none)

# Destroy previous coin count scoreboard
scoreboard objectives remove __coins_score
scoreboard objectives add __coins_score dummy {"text":"Coins","color":"yellow"} 
scoreboard objectives setdisplay sidebar __coins_score

# pms will display their owner's coin count

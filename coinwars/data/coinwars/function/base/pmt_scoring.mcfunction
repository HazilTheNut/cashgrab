# base/pmt_scoring.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tallies up coin score of player owner
#
# Arguments: (none)

# Copy player coin count to the coin display objective
execute if score NUM_GAMESTATE num matches 1.. run scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_score = @a[tag=t_pm_owner,limit=1] coins

# Check for victory in ffa game
execute if score NUM_GAMESTATE num matches 1 if score @a[tag=t_pm_owner,limit=1] coins >= GOAL coins run tellraw @a [{"type":"selector","selector":"@a[tag=t_pm_owner,limit=1]"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 1 if score @a[tag=t_pm_owner,limit=1] coins >= GOAL coins run function coinwars:end_game

# Contribute to team score
execute if score NUM_GAMESTATE num matches 2 if score @a[tag=t_pm_owner,limit=1] team_id matches 1 run scoreboard players operation RED_TEAM coins += @a[tag=t_pm_owner,limit=1] coins
execute if score NUM_GAMESTATE num matches 2 if score @a[tag=t_pm_owner,limit=1] team_id matches 2 run scoreboard players operation BLUE_TEAM coins += @a[tag=t_pm_owner,limit=1] coins

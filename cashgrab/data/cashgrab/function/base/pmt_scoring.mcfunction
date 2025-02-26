# base/pmt_scoring.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tallies up coin score of player owner
#
# Arguments: (none)

# Do not calculate score while game is not running
execute if score NUM_GAMESTATE num matches ..0 run return 0

# Copy player coin count to the coin display objective
scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_score = @a[tag=t_pm_owner,limit=1] coins

# Check for victory
execute if score @a[tag=t_pm_owner,limit=1] coins >= GOAL coins run tellraw @a [{"type":"selector","selector":"@a[tag=t_pm_owner,limit=1]"},{"type":"text","color":"white","text":" wins!"}]
execute if score @a[tag=t_pm_owner,limit=1] coins >= GOAL coins run function cashgrab:end_game

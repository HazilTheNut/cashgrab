# base/gt_player_count.mcfunction
#
# Context: Global level
#
# Summary: Counts number of players logged in and sets NUM_PLAYERCOUNT_CHANGED if it changed
#
# Arguments: (none)
scoreboard players set NUM_PLAYERCOUNT num 0
scoreboard players set NUM_PLAYERCOUNT_CHANGED num 0
execute as @a run scoreboard players add NUM_PLAYERCOUNT num 1
execute unless score NUM_PLAYERCOUNT num = NUM_PLAYERCOUNT_PREV num run scoreboard players set NUM_PLAYERCOUNT_CHANGED num 1
scoreboard players operation NUM_PLAYERCOUNT_PREV num = NUM_PLAYERCOUNT num

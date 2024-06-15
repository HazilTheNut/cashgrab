# base/gt_scoring.mcfunction
#
# Context: Global tick
#
# Summary: Handles game scoring mechanics
#
# Arguments: (none)

# =============================
# Coin score display
execute if score NUM_PLAYERCOUNT_CHANGED num matches 1 if score NUM_GAMESTATE num matches 1.. run scoreboard players set NUM_REBUILD_COINSCORE num 1

# Destroy coin count scoreboard if player count changes
execute if score NUM_REBUILD_COINSCORE num matches 1 run scoreboard objectives remove __coins_score
execute if score NUM_REBUILD_COINSCORE num matches 1 run scoreboard objectives add __coins_score dummy {"text":"Coins","color":"yellow"} 
execute if score NUM_REBUILD_COINSCORE num matches 1 run scoreboard objectives setdisplay sidebar __coins_score

# Copy player coin counts to display
execute if score NUM_GAMESTATE num matches 1.. as @a run scoreboard players operation @s __coins_score = @s coins

# Show goal coin amount
scoreboard players operation GOAL __coins_score = GOAL coins

# Show team totals if playing in team gamemode
execute if score NUM_GAMESTATE num matches 2 run scoreboard players set RED_TEAM coins 0
execute if score NUM_GAMESTATE num matches 2 as @a[scores={team_id=1}] run scoreboard players operation RED_TEAM coins += @s coins
execute if score NUM_GAMESTATE num matches 2 run scoreboard players operation RED_TEAM __coins_score = RED_TEAM coins

execute if score NUM_GAMESTATE num matches 2 run scoreboard players set BLUE_TEAM coins 0
execute if score NUM_GAMESTATE num matches 2 as @a[scores={team_id=2}] run scoreboard players operation BLUE_TEAM coins += @s coins
execute if score NUM_GAMESTATE num matches 2 run scoreboard players operation BLUE_TEAM __coins_score = BLUE_TEAM coins

scoreboard players set NUM_REBUILD_COINSCORE num 0

# =============================
# Check for winners
execute if score NUM_GAMESTATE num matches 1 as @a if score @s coins >= GOAL coins run tellraw @a [{"type":"selector","selector":"@s"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 1 as @a if score @s coins >= GOAL coins run scoreboard players set NUM_END_GAME num 1

execute if score NUM_GAMESTATE num matches 2 if score RED_TEAM coins >= GOAL coins run tellraw @a [{"type":"text","color":"red","text":"Red Team"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 2 if score BLUE_TEAM coins >= GOAL coins run tellraw @a [{"type":"text","color":"blue","text":"Blue Team"},{"type":"text","color":"white","text":" wins!"}]
execute if score NUM_GAMESTATE num matches 2 if score RED_TEAM coins >= GOAL coins run scoreboard players set NUM_END_GAME num 1
execute if score NUM_GAMESTATE num matches 2 if score BLUE_TEAM coins >= GOAL coins run scoreboard players set NUM_END_GAME num 1

# =============================
# Game end
execute if score NUM_END_GAME num matches 1 as @a run function coinwars:base/pe_cleanup
execute if score NUM_END_GAME num matches 1 as @e[scores={eid_state=1..}] run function coinwars:base/pe_cleanup_if_ownerless
execute if score NUM_END_GAME num matches 1 run kill @e[type=minecraft:item]
execute if score NUM_END_GAME num matches 1 run kill @e[tag=t_coinshower]
execute if score NUM_END_GAME num matches 1 run scoreboard players set @a coins 0
execute if score NUM_END_GAME num matches 1 run scoreboard players set @a class 0
execute if score NUM_END_GAME num matches 1 run scoreboard players set NUM_GAMESTATE num 0
execute if score NUM_END_GAME num matches 1 run tag @a add t_return_to_lobby

scoreboard players set NUM_END_GAME num 0

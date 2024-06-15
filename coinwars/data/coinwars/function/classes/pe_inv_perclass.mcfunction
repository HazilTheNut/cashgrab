# classes/pe_inv_perclass.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Reapplies entity's equipped class's inventory
#
# Arguments: (none)

execute if entity @s[scores={class=-1}] run function coinwars:classes/test_a/pe_inv
execute if entity @s[scores={class=-2}] run function coinwars:classes/test_b/pe_inv
execute if entity @s[scores={class=-3}] run function coinwars:classes/test_c/pe_inv
execute if entity @s[scores={class=-4}] run function coinwars:classes/test_d/pe_inv
execute if entity @s[scores={class=-10}] run function coinwars:classes/mapmaker/pe_inv

execute if entity @s[scores={class=1}] run function coinwars:classes/griefer/pe_inv
execute if entity @s[scores={class=2}] run function coinwars:classes/skirmisher/pe_inv
execute if entity @s[scores={class=3}] run function coinwars:classes/spectre/pe_inv
execute if entity @s[scores={class=4}] run function coinwars:classes/ranger/pe_inv
execute if entity @s[scores={class=5}] run function coinwars:classes/artillery/pe_inv
execute if entity @s[scores={class=6}] run function coinwars:classes/champion/pe_inv
execute if entity @s[scores={class=7}] run function coinwars:classes/frostknight/pe_inv
execute if entity @s[scores={class=8}] run function coinwars:classes/titan/pe_inv
execute if entity @s[scores={class=9}] run function coinwars:classes/alchemist/pe_inv
execute if entity @s[scores={class=10}] run function coinwars:classes/chronomancer/pe_inv

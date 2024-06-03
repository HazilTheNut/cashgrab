# classes/pe_loop_perclass.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Generic loop/step function for a class
#
# Arguments: (none)

execute if entity @s[scores={class=-3}] run return run function coinwars:classes/test_c/pe_loop
execute if entity @s[scores={class=-10}] run return run function coinwars:classes/mapmaker/pe_loop

execute if entity @s[scores={class=1}] run return run function coinwars:classes/griefer/pe_loop
execute if entity @s[scores={class=2}] run return run function coinwars:classes/skirmisher/pe_loop
execute if entity @s[scores={class=3}] run return run function coinwars:classes/spectre/pe_loop
execute if entity @s[scores={class=4}] run return run function coinwars:classes/ranger/pe_loop
execute if entity @s[scores={class=5}] run return run function coinwars:classes/artillery/pe_loop
execute if entity @s[scores={class=6}] run return run function coinwars:classes/champion/pe_loop
execute if entity @s[scores={class=7}] run return run function coinwars:classes/frostknight/pe_loop
execute if entity @s[scores={class=8}] run return run function coinwars:classes/titan/pe_loop
execute if entity @s[scores={class=9}] run return run function coinwars:classes/alchemist/pe_loop

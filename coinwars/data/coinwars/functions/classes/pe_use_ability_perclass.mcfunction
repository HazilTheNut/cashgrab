# classes/pe_use_ability_perclass.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)
#
# Returns: Ability cooldown, in ticks

execute if entity @s[scores={class=-1}] run return run function coinwars:classes/test_a/pe_use_ability
execute if entity @s[scores={class=-2}] run return run function coinwars:classes/test_b/pe_use_ability
execute if entity @s[scores={class=-3}] run return run function coinwars:classes/test_c/pe_use_ability
execute if entity @s[scores={class=-4}] run return run function coinwars:classes/test_d/pe_use_ability
execute if entity @s[scores={class=-10}] run return run function coinwars:classes/mapmaker/pe_use_ability

execute if entity @s[scores={class=1}] run return run function coinwars:classes/griefer/pe_use_ability
execute if entity @s[scores={class=2}] run return run function coinwars:classes/skirmisher/pe_use_ability
execute if entity @s[scores={class=3}] run return run function coinwars:classes/spectre/pe_use_ability
execute if entity @s[scores={class=4}] run return run function coinwars:classes/ranger/pe_use_ability
execute if entity @s[scores={class=5}] run return run function coinwars:classes/artillery/pe_use_ability
execute if entity @s[scores={class=6}] run return run function coinwars:classes/champion/pe_use_ability
execute if entity @s[scores={class=7}] run return run function coinwars:classes/frostknight/pe_use_ability
execute if entity @s[scores={class=8}] run return run function coinwars:classes/titan/pe_use_ability

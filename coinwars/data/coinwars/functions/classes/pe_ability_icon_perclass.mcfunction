# classes/pe_ability_icon_perclass.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments (acquired from coinwars:abi_args):
#	charges		: Number of charges of ability

execute if entity @s[scores={class=-1}] run function coinwars:classes/test_a/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=-2}] run function coinwars:classes/test_b/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=-3}] run function coinwars:classes/test_c/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=-4}] run function coinwars:classes/test_d/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=-10}] run function coinwars:classes/mapmaker/pe_ability_icon with storage coinwars:abi_args

execute if entity @s[scores={class=1}] run function coinwars:classes/griefer/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=2}] run function coinwars:classes/skirmisher/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=3}] run function coinwars:classes/spectre/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=4}] run function coinwars:classes/ranger/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=4}] run function coinwars:classes/ranger/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=5}] run function coinwars:classes/artillery/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=6}] run function coinwars:classes/champion/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=7}] run function coinwars:classes/frostknight/pe_ability_icon with storage coinwars:abi_args
execute if entity @s[scores={class=8}] run function coinwars:classes/titan/pe_ability_icon with storage coinwars:abi_args

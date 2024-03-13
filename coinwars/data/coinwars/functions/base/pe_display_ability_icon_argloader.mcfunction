# base/pe_display_ability_icon_argloader.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Loads args for and runs coinwars:base/pe_display_ability_icon
#
# Arguments: (none)

execute store result storage coinwars:abi_args charges int 1 run scoreboard players get @s ability_charges
execute if entity @s[scores={ability_charges=1..}] run function coinwars:classes/pe_ability_icon_perclass
execute if entity @s[scores={ability_charges=1..}] run return 0

execute store result storage coinwars:abi_args cd_secs int 1 run scoreboard players get @s ability_cd_secs
function coinwars:base/pe_display_ability_icon with storage coinwars:abi_args

# base/pmt_inv_ability_icon_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Loads args for and runs coinwars:classes/pmt_inv_ability_icon_perclass or coinwars:base/pmt_inv_ability_cd_icon
#
# Arguments: (none)

# If player has an ability charge, display class's ability icon
execute store result storage coinwars:abi_args charges int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] ability_charges
#execute if entity @a[tag=t_pm_owner,scores={ability_charges=1..}] run function coinwars:classes/pmt_inv_ability_icon_perclass
execute if entity @a[tag=t_pm_owner,scores={ability_charges=1..}] run return 0

# If not, display that it is on cooldown
execute store result storage coinwars:abi_args cd_secs int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] ability_cd_secs
function coinwars:base/pmt_inv_ability_cd_icon with storage coinwars:abi_args

# classes/pmt_class_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments (acquired from cashgrab:abi_args):
#	charges		: Number of charges of ability

execute if score DEVELOPER_MODE num matches 1 if entity @a[tag=t_pm_owner,scores={class=-10}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv_ability_icon with storage cashgrab:abi_args

execute if entity @a[tag=t_pm_owner,scores={class=1}] run return run function cashgrab:classes/griefer/pmt_griefer_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=2}] run return run function cashgrab:classes/skirmisher/pmt_skirmisher_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=3}] run return run function cashgrab:classes/spectre/pmt_spectre_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=4}] run return run function cashgrab:classes/ranger/pmt_ranger_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=5}] run return run function cashgrab:classes/artillery/pmt_artillery_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=6}] run return run function cashgrab:classes/champion/pmt_champion_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=7}] run return run function cashgrab:classes/frostknight/pmt_frostknight_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=8}] run return run function cashgrab:classes/titan/pmt_titan_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=9}] run return run function cashgrab:classes/alchemist/pmt_alchemist_inv_ability_icon with storage cashgrab:abi_args
execute if entity @a[tag=t_pm_owner,scores={class=10}] run return run function cashgrab:classes/chronomancer/pmt_chronomancer_inv_ability_icon with storage cashgrab:abi_args

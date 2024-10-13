# classes/pmt_inv_perclass.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Reapplies entity's equipped class's inventory
#
# Arguments: (none)

execute if score DEVELOPER_MODE num matches 1 if entity @a[tag=t_pm_owner,scores={class=-10}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv

execute if entity @a[tag=t_pm_owner,scores={class=1}] run function cashgrab:classes/griefer/pmt_griefer_inv
execute if entity @a[tag=t_pm_owner,scores={class=2}] run function cashgrab:classes/skirmisher/pmt_skirmisher_inv
execute if entity @a[tag=t_pm_owner,scores={class=3}] run function cashgrab:classes/spectre/pmt_spectre_inv
#execute if entity @a[tag=t_pm_owner,scores={class=4}] run function cashgrab:classes/ranger/pmt_ranger_inv
#execute if entity @a[tag=t_pm_owner,scores={class=5}] run function cashgrab:classes/artillery/pmt_artillery_inv
#execute if entity @a[tag=t_pm_owner,scores={class=6}] run function cashgrab:classes/champion/pmt_champion_inv
#execute if entity @a[tag=t_pm_owner,scores={class=7}] run function cashgrab:classes/frostknight/pmt_frostknight_inv
#execute if entity @a[tag=t_pm_owner,scores={class=8}] run function cashgrab:classes/titan/pmt_titan_inv
#execute if entity @a[tag=t_pm_owner,scores={class=9}] run function cashgrab:classes/alchemist/pmt_alchemist_inv
#execute if entity @a[tag=t_pm_owner,scores={class=10}] run function cashgrab:classes/chronomancer/pmt_chronomancer_inv

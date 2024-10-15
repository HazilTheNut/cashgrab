# classes/pmtl_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)
#
# Returns: Ability cooldown, in ticks

execute if score DEVELOPER_MODE num matches 1 if entity @a[tag=t_pm_owner,scores={class=-10}] run return run function cashgrab:classes/mapmaker/pmtl_mapmaker_use_ability

execute if entity @a[tag=t_pm_owner,scores={class=1}] run return run function cashgrab:classes/griefer/pmtl_griefer_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=2}] run return run function cashgrab:classes/skirmisher/pmtl_skirmisher_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=3}] run return run function cashgrab:classes/spectre/pmtl_spectre_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=4}] run return run function cashgrab:classes/ranger/pmtl_ranger_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=5}] run return run function cashgrab:classes/artillery/pmtl_artillery_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=6}] run return run function cashgrab:classes/champion/pmtl_champion_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=7}] run return run function cashgrab:classes/frostknight/pmtl_frostknight_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=8}] run return run function cashgrab:classes/titan/pmtl_titan_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=9}] run return run function cashgrab:classes/alchemist/pmtl_alchemist_use_ability
execute if entity @a[tag=t_pm_owner,scores={class=10}] run return run function cashgrab:classes/chronomancer/pmtl_chronomancer_use_ability

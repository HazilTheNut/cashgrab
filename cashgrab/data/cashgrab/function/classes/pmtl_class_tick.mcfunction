# classes/pmtl_class_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Branching tick function for equipped class
#
# Arguments: (none)

execute if score DEVELOPER_MODE num matches 1 if entity @a[tag=t_pm_owner,scores={class=-10}] run return run function cashgrab:classes/mapmaker/pmtl_mapmaker_tick

execute if entity @a[tag=t_pm_owner,scores={class=1}] run return run function cashgrab:classes/griefer/pmtl_griefer_tick
execute if entity @a[tag=t_pm_owner,scores={class=2}] run return run function cashgrab:classes/skirmisher/pmtl_skirmisher_tick
execute if entity @a[tag=t_pm_owner,scores={class=3}] run return run function cashgrab:classes/spectre/pmtl_spectre_tick
execute if entity @a[tag=t_pm_owner,scores={class=4}] run return run function cashgrab:classes/ranger/pmtl_ranger_tick
execute if entity @a[tag=t_pm_owner,scores={class=5}] run return run function cashgrab:classes/artillery/pmtl_artillery_tick
execute if entity @a[tag=t_pm_owner,scores={class=6}] run return run function cashgrab:classes/champion/pmtl_champion_tick
execute if entity @a[tag=t_pm_owner,scores={class=7}] run return run function cashgrab:classes/frostknight/pmtl_frostknight_tick
execute if entity @a[tag=t_pm_owner,scores={class=8}] run return run function cashgrab:classes/titan/pmtl_titan_tick
execute if entity @a[tag=t_pm_owner,scores={class=9}] run return run function cashgrab:classes/alchemist/pmtl_alchemist_tick
execute if entity @a[tag=t_pm_owner,scores={class=10}] run return run function cashgrab:classes/chronomancer/pmtl_chronomancer_tick

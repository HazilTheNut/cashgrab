# classes/mapmaker/pmtl_mapmaker_use_ability.mcfunction
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

# Toggle cv_A value
scoreboard players add @a[tag=t_pm_owner] cv_A 1
scoreboard players set @a[tag=t_pm_owner,scores={cv_A=2..}] cv_A 0

effect give @a[tag=t_pm_owner,scores={cv_A=1}] minecraft:night_vision infinite
effect clear @a[tag=t_pm_owner,scores={cv_A=0}] minecraft:night_vision

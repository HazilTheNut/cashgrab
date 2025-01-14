# trinkets/bandage/pmtl_bandage_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Runs when trinket is used
#
# Arguments: (none)

effect give @a[tag=t_pm_owner,limit=1] minecraft:regeneration 3 2

#clear @a[tag=t_pm_owner,limit=1] minecraft:filled_map

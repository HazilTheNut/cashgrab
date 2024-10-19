# trinkets/vigor_flask/pmtl_vigor_flask_use_item.mcfunction
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

# Remove empty bottle
clear @a[tag=t_pm_owner,limit=1] minecraft:glass_bottle

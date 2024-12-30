# trinkets/spring_plume/pmtl_spring_plume_use_item.mcfunction
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

tag @a[tag=t_pm_owner,limit=1] add t_grab_release


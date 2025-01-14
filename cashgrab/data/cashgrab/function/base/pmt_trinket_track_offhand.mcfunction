# base/pmtl_trinket_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Handles detection of whether trinket is in offhand or not
#
# Arguments: (none)

execute store result score @a[tag=t_pm_owner,limit=1] trinket_in_offhand run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}]

# base/pmt_tick_gameplay.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Gameplay activity_state
#
# Arguments: (none)

# Run tick functions for trinket and class
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_trinket_tick with entity @s data.trinket_info
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:classes/pmtl_class_tick with entity @s data.class_info

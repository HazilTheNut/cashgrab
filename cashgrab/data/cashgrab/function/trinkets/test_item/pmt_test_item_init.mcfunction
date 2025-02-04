# trinkets/pmt_test_item_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Test Trinket and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 16
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 16

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_eggs 0

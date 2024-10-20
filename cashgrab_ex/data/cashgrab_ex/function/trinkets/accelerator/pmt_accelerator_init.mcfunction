# trinkets/accelerator/pmt_accelerator_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Accelerator and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 1

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_maps 0

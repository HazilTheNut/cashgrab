# trinkets/hedge_seed/pmt_hedge_seed_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Echo Bolt and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 40
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 40

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_mangrove_leaves 0

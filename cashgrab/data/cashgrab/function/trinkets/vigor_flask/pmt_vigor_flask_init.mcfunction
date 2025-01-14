# trinkets/vigor_flask/pmt_vigor_flask_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Vigor Flask and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 1

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_potions 0

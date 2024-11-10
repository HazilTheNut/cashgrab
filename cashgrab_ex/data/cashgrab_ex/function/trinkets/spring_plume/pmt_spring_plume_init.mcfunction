# trinkets/spring_plume/pmt_spring_plume_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Bandage and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 2
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 2

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_feathers 0

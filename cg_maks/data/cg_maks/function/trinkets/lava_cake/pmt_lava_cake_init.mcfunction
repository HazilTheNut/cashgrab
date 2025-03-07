# trinkets/lava_cake/pmt_lava_cake_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Lava Cake and it's charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 2
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 2

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_clay_balls 0
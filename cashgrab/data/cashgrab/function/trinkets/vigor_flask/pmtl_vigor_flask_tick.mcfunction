# trinkets/pmtl_vigor_flask_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Inventory tracking and handling of trinkets
#
# Arguments: (none)

# If you use up a potion while holding your trinket, deduct trinket_charges
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_potion=1..,trinket_held=1}] run scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={trinket_charges=1..}] trinket_charges 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_potion=1..,trinket_held=1}] run clear @a[tag=t_pm_owner,limit=1] minecraft:glass_bottle
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_potion=1..,trinket_held=1}] run function cashgrab:util/pmt_inv_trinket_argloader

# base/pmt_inv_trinket_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Loads args for and runs coinwars:base/pmt_inv_trinket
#
# Arguments: (none)

# If player has a trinket charge, display trinket item
execute store result storage coinwars:trinket_args charges int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] trinket_charges
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..}] run function coinwars:base/pmt_inv_trinket with storage coinwars:trinket_args
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..}] run return 0

# If not, empty the slot
item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:air

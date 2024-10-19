# util/pmt_inv_trinket_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Loads args for and runs cashgrab:trinkets/pmt_trinket_inv
#
# Arguments: (none)

# Erase existing trinket items if they are somehow lingering around
clear @a[tag=t_pm_owner,limit=1] *[custom_data={is_trinket:1}]

# Check to see if player class is a dev tool and do nothing if so (mapmaker class uses hotbar.3)
execute store result score @s temp_A run data get entity @s data.class_info.is_dev_tool 1
execute if score @s temp_A matches 1.. run return 0

# If player has a trinket charge, display trinket item
execute store result storage cashgrab:trinket_args charges int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] trinket_charges
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..,trinket_in_offhand=0}] run data merge storage cashgrab:trinket_args {slot:"hotbar.3"}
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..,trinket_in_offhand=1}] run data merge storage cashgrab:trinket_args {slot:"weapon.offhand"}
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..}] run data modify storage cashgrab:trinket_args func_pmt_inv set from entity @s data.trinket_info.func_pmt_inv
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..}] run function cashgrab:trinkets/pmt_trinket_inv with storage cashgrab:trinket_args
execute if entity @a[tag=t_pm_owner,scores={trinket_charges=1..}] run return 0

# If not, empty the slot
item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:air

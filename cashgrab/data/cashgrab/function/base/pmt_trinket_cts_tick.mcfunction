# base/pmt_trinket_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for during Class-and-Trinket selection
#
# Arguments: (none)

# Track whether trinket is in offhand
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 1

# Get trinket quantity in inventory
function cashgrab:base/pmt_trinket_count

# If trinket count changed, reload display for trinket and restore charge count
execute unless score @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run tag @a[tag=t_pm_owner,limit=1] add t_trinket_count_changed
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_trinket_count_changed] run scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] trinket_charges_max
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_trinket_count_changed] run function cashgrab:util/pmt_inv_trinket_argloader
tag @a[tag=t_pm_owner,limit=1,tag=t_trinket_count_changed] remove t_trinket_count_changed

# Store current trinket charge count into previous
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges

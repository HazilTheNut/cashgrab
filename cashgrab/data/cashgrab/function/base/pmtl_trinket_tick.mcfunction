# base/pmtl_trinket_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Branching tick function for equipped trinket
#
# Arguments:
#	func_pmtl_use_item	: function to run when the trinket item is used

# Track whether trinket is in offhand
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 1

# Get trinket quantity in inventory
function cashgrab:base/pmt_trinket_count

# If current charge count is less than previous, trinket was used
$execute if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run function $(func_pmtl_use_item)

# If trinket count changed, reload display for trinket
execute unless score @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] __trinket_charges_prev run function cashgrab:util/pmt_inv_trinket_argloader

# Store current into previous
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges

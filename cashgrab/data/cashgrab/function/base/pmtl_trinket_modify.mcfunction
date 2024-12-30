# base/pmtl_trinket_modify.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Modifies charge count for equipped trinket, ran when player has nonzero trinket_charges_modify scoreboard value
#
# Arguments: (none)

# Modify charge count
scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges += @a[tag=t_pm_owner,limit=1] trinket_charges_modify

# Apply min and max values
execute if score @a[tag=t_pm_owner,limit=1] trinket_charges > @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] trinket_charges_max
execute if score @a[tag=t_pm_owner,limit=1] trinket_charges matches ..0 run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 0

# Set prev to current to make changes permanent
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges

# Redraw trinket
function cashgrab:util/pmt_inv_trinket_argloader

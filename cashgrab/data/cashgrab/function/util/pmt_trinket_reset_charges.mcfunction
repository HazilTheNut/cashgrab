# util/pmt_trinket_reset_charges.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Restores equipped trinket to its original charge count
#
# Arguments: (none)

# Store previous into current
scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] trinket_charges_max
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges_max

# Reload display for trinket
function cashgrab:util/pmt_inv_trinket_argloader

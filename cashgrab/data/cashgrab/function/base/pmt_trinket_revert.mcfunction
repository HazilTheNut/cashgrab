# base/pmt_trinket_revert.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Reverts equipped trinket to state of previous server tick
#
# Arguments: (none)

tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] "base/pmt_trinket_revert"

# Store previous into current
scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] __trinket_charges_prev

# Reload display for trinket
function cashgrab:util/pmt_inv_trinket_argloader

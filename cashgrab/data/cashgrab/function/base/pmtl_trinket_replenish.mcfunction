# base/pmtl_trinket_replenish.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Resets charge count for equipped trinket, ran when player is tagged with t_trinket_replenish
#
# Arguments: (none)

scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges = @a[tag=t_pm_owner,limit=1] trinket_charges_max
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges_max
function cashgrab:util/pmt_inv_trinket_argloader

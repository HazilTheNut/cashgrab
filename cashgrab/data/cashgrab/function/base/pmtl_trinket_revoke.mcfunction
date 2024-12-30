# base/pmtl_trinket_revoke.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Sets charge count for equipped trinket to 0, ran when player is tagged with t_trinket_revoke
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 0
scoreboard players set @a[tag=t_pm_owner,limit=1] __trinket_charges_prev 0
function cashgrab:util/pmt_inv_trinket_argloader

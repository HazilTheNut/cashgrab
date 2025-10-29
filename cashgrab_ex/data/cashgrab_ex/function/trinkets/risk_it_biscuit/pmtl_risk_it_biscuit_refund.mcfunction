# trinkets/risk_it_biscuit/pmtl_risk_it_biscuit_refund.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Refunds trinket and displays message
#
# Arguments: (none)

tellraw @a[tag=t_pm_owner] {color:"red","type":text,text:"You don't have the appetite right now."}
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_modify 1

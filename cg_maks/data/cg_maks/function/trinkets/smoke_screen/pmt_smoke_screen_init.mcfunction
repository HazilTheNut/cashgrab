# trinkets/smoke_screen/pmt_smoke_screen_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Smoke Screen and it's charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 3
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 3

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_ink_sac 0
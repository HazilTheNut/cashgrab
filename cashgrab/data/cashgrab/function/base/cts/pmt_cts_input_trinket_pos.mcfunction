# base/cts/pmt_cts_input_trinket_pos.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Class-and-trinket trinket position configuration input collector function
#
# Arguments: (none)

scoreboard players add @a[tag=t_pm_owner,limit=1] __trinket_cfg_pos 1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__trinket_cfg_pos=3..}] __trinket_cfg_pos 0

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found

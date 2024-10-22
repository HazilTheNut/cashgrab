# base/pmt_reset_cts.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Resets player selected class and trinket
#
# Arguments: (none)

# Reset selections to index 1
scoreboard players set @a[tag=t_pm_owner,limit=1] class 1
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket 1

# Recover class and trinket data
execute store result storage cashgrab:pm_recovery_args class_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] class
function cashgrab:base/pm_recover_class with storage cashgrab:pm_recovery_args

execute store result storage cashgrab:pm_recovery_args trinket_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] trinket_id
function cashgrab:base/pm_recover_trinket with storage cashgrab:pm_recovery_args


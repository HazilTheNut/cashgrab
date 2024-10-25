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
scoreboard players set @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx 1
scoreboard players set @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx 1

# Recover class and trinket data
execute store result storage cashgrab:pm_recovery_args class_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx
function cashgrab:base/pm_recover_class with storage cashgrab:pm_recovery_args

execute store result storage cashgrab:pm_recovery_args trinket_id int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx
function cashgrab:base/pm_recover_trinket with storage cashgrab:pm_recovery_args


# Arguments:
#	func_increment		: Function to run to increment data

execute store result storage cgada:record_args class_idx int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx
execute store result storage cgada:record_args trinket_idx int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx
$function $(func_increment) with storage cgada:record_args

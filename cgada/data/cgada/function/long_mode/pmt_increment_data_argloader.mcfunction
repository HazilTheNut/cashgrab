# Arguments:
#	func_increment		: Function to run to increment data

execute store result storage cgada:record_args entry_idx int 1 run scoreboard players get @s __cgada_lm_pm_entry_idx
$function $(func_increment) with storage cgada:record_args

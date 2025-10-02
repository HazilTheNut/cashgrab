
execute store result storage cgada:record_args class_idx int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx
execute store result storage cgada:record_args trinket_idx int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx
data modify storage cgada:record_args map_name set string storage cgada:map_name

function cgada:long_mode/pmt_append_entry with storage cgada:record_args

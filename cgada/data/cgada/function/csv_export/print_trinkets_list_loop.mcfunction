# Arguments:
#	trinket_idx		: Trinket data index in cashgrab:game_info.trinkets

# Append to strings
$data modify storage cgada:csv s_temp_trinket_name set from storage cashgrab:game_info trinkets[$(trinket_idx)].s_trinket_name
function cgada:csv_export/print_trinkets_list_write with storage cgada:csv

# Increment index and loop
execute store result storage cgada:csv_args trinket_idx int 1 run scoreboard players add CGADA_IDX num 1
execute if score CGADA_IDX num < NUM_CTS_TRINKETS_LIST_LEN num run function cgada:csv_export/print_trinkets_list_loop_recursion

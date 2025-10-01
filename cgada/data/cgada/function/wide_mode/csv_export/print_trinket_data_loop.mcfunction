# Arguments:
#	class_idx		: Class data index in cashgrab:game_info.classes
#	trinket_idx		: Trinket data index in cashgrab:game_info.trinkets

#$tellraw @a "Accessing class $(class_idx) trinket $(trinket_idx)"

# Append to strings
$data modify storage cgada:csv i_temp_trinket_entries set from storage cgada:data class_data[$(class_idx)].trinket_data[$(trinket_idx)].i_entry_total
$data modify storage cgada:csv i_temp_trinket_coins set from storage cgada:data class_data[$(class_idx)].trinket_data[$(trinket_idx)].i_coins_total
function cgada:wide_mode/csv_export/print_trinket_data_write with storage cgada:csv

# Increment index and loop
execute store result storage cgada:csv_args trinket_idx int 1 run scoreboard players add CGADA_TRINKET_IDX num 1
execute if score CGADA_TRINKET_IDX num <= NUM_CTS_TRINKET_ID_MAX num run function cgada:wide_mode/csv_export/print_trinket_data_loop_recursion

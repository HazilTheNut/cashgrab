# Arguments:
#	class_idx		: Trinket data index in cashgrab:game_info.trinkets

#$tellraw @a "Accessing class $(class_idx)"

# Generate class data string
$data modify storage cgada:csv s_temp_class_name set from storage cgada:wide_data class_data[$(class_idx)].s_class_name
$data modify storage cgada:csv i_temp_class_entries set from storage cgada:wide_data class_data[$(class_idx)].i_entry_total
$data modify storage cgada:csv i_temp_class_coins set from storage cgada:wide_data class_data[$(class_idx)].i_coins_total
$data modify storage cgada:csv i_temp_class_kills set from storage cgada:wide_data class_data[$(class_idx)].i_kills_total
$data modify storage cgada:csv i_temp_class_deaths set from storage cgada:wide_data class_data[$(class_idx)].i_deaths_total

# Generate trinket data entries and coins strings
data modify storage cgada:csv s_data_trinket_entries set value ""
data modify storage cgada:csv s_data_trinket_coins set value ""
scoreboard players set CGADA_TRINKET_IDX num 1
data modify storage cgada:csv_args trinket_idx set value 1
function cgada:wide_mode/csv_export/print_trinket_data_loop with storage cgada:csv_args

# Write to data string
function cgada:wide_mode/csv_export/print_class_data_write with storage cgada:csv

# Increment index and loop
execute store result storage cgada:csv_args class_idx int 1 run scoreboard players add CGADA_CLASS_IDX num 1
execute if score CGADA_CLASS_IDX num <= NUM_CTS_CLASS_ID_MAX num run function cgada:wide_mode/csv_export/print_class_data_loop_recursion

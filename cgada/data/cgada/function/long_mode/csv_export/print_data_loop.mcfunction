
# Prepare data for writing
execute store result storage cgada:long_csv temp_i_idx int 1 run scoreboard players get NUM_CGADA_LM_CSV_IDX_CUR num
$data modify storage cgada:long_csv temp_s_class_name set from storage cgada:long_data entries[$(entry_idx)].s_class_name
$data modify storage cgada:long_csv temp_s_trinket_name set from storage cgada:long_data entries[$(entry_idx)].s_trinket_name
$data modify storage cgada:long_csv temp_s_map_name set from storage cgada:long_data entries[$(entry_idx)].s_map_name
$data modify storage cgada:long_csv temp_i_game_num set from storage cgada:long_data entries[$(entry_idx)].i_game_num
$data modify storage cgada:long_csv temp_i_kills_total set from storage cgada:long_data entries[$(entry_idx)].i_kills_total
$data modify storage cgada:long_csv temp_i_coins_total set from storage cgada:long_data entries[$(entry_idx)].i_coins_total
$data modify storage cgada:long_csv temp_b_entry_complete set from storage cgada:long_data entries[$(entry_idx)].b_entry_complete

# Write
function cgada:long_mode/csv_export/print_data_write with storage cgada:long_csv

# Increment index and loop
execute store result storage cgada:csv_args entry_idx int 1 run scoreboard players add NUM_CGADA_LM_CSV_IDX_CUR num 1
execute if score NUM_CGADA_LM_CSV_IDX_CUR num < NUM_CGADA_LM_CSV_IDX_END num run function cgada:long_mode/csv_export/print_data_loop_recursion

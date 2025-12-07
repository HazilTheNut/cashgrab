
data modify storage cgada:long_csv s_data set value ""
data modify storage cgada:long_csv temp_i_idx set value 0
data modify storage cgada:long_csv temp_s_class_name set value ""
data modify storage cgada:long_csv temp_s_trinket_name set value ""
data modify storage cgada:long_csv temp_s_map_name set value ""
data modify storage cgada:long_csv temp_i_game_num set value 0
data modify storage cgada:long_csv temp_i_kills_total set value 0
data modify storage cgada:long_csv temp_i_coins_total set value 0
data modify storage cgada:long_csv temp_b_entry_complete set value 0
data modify storage cgada:long_csv temp_i_gameplay_lifetime_ticks set value 0

scoreboard players set NUM_CGADA_LM_CSV_IDX_CUR num 0
scoreboard players set NUM_CGADA_LM_CSV_IDX_END num 0
execute store result score NUM_CGADA_LM_CSV_IDX_END num run data get storage cgada:long_data entries

scoreboard players set NUM_CGADA_LM_DISP_PERIOD num 750
scoreboard players set NUM_CGADA_LM_DISP_PERIOD_MEAS num 0

# Do not export if there is no data
execute if score NUM_CGADA_LM_CSV_IDX_END num matches ..0 run return 0

# Print entry data
function cgada:long_mode/csv_export/print_data_loop {entry_idx:0}

# Display copy link (if last idx % period == 0, this should have already printed)
execute unless score NUM_CGADA_LM_DISP_PERIOD_MEAS num matches 0 run function cgada:long_mode/csv_export/display_copy_link with storage cgada:long_csv

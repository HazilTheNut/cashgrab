
# Prepare initial data entry
data modify storage cgada:long_data entry_init set value {\
s_class_name:"",\
s_trinket_name:"",\
s_map_name:"",\
i_game_num:0,\
i_kills_total:0,\
i_coins_total:0,\
b_entry_complete:0\
}
$data modify storage cgada:long_data entry_init.s_class_name set string storage cashgrab:game_info classes[$(class_idx)].s_class_name
$data modify storage cgada:long_data entry_init.s_trinket_name set string storage cashgrab:game_info trinkets[$(trinket_idx)].s_trinket_name
data modify storage cgada:long_data entry_init.s_map_name set string storage cgada:map_info map_name
data modify storage cgada:long_data entry_init.i_game_num set from storage cgada:generic_data i_games_played

# Append to data structure
data modify storage cgada:long_data entries append from storage cgada:long_data entry_init

# Copy global index counter to pm's internal index
scoreboard players set @s __cgada_lm_pm_entry_idx 0
scoreboard players operation @s __cgada_lm_pm_entry_idx = NUM_CGADA_LM_NEXT_IDX num
scoreboard players add NUM_CGADA_LM_NEXT_IDX num 1
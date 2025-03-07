# Arguments:
#	idx		: Trinket data index in cashgrab:game_info.trinkets

# Append new entry to trinket data template
data modify storage cgada:data trinket_data_template append value {\
s_trinket_name:"",\
i_entry_total:0,\
i_coins_total:0,\
}

# Copy trinket name from cashgrab:game_info.trinkets
$data modify storage cgada:data trinket_data_template[$(idx)].s_trinket_name set from storage cashgrab:game_info trinkets[$(idx)].s_trinket_name

# Increment index then loop
execute store result storage cgada:arg_idx idx int 1 run scoreboard players add CGADA_IDX num 1
execute if score CGADA_IDX num < NUM_CTS_TRINKETS_LIST_LEN num run function cgada:generate_trinket_data_template_loop_recursion with storage cgada:arg_idx

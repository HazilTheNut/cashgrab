# Arguments:
#	idx		: Class data index in cashgrab:game_info.classes

# Append new entry to class data
data modify storage cgada:wide_data class_data append value {\
s_class_name:"",\
trinket_data:[],\
i_entry_total:0,\
i_kills_total:0,\
i_coins_total:0,\
i_deaths_total:0,\
}

# Copy class name from cashgrab:game_info.classes
$data modify storage cgada:wide_data class_data[$(idx)].s_class_name set from storage cashgrab:game_info classes[$(idx)].s_class_name

# Copy trinket data template to cgada:wide_data.class_data[idx].array_trinket_entry_totals
$data modify storage cgada:wide_data class_data[$(idx)].trinket_data set from storage cgada:wide_data trinket_data_template

# Increment index then loop
execute store result storage cgada:arg_idx idx int 1 run scoreboard players add CGADA_IDX num 1
execute if score CGADA_IDX num <= NUM_CTS_CLASS_ID_MAX num run function cgada:wide_mode/generate_class_data_loop_recursion with storage cgada:arg_idx

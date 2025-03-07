
# Initialize header strings
data modify storage cgada:csv s_category_headers set value "Class Data,,,,,Trinket Entries"
data modify storage cgada:csv s_column_headers set value "Class Name,Entries,Coins,Kills,Deaths"

data modify storage cgada:csv s_temp_trinket_name set value ""
data modify storage cgada:csv s_trinket_list set value ""
data modify storage cgada:csv s_trinket_list_commas set value ""

data modify storage cgada:csv s_data set value ""
data modify storage cgada:csv s_temp_class_name set value ""
data modify storage cgada:csv i_temp_class_entries set value 0
data modify storage cgada:csv i_temp_class_coins set value 0
data modify storage cgada:csv i_temp_class_kills set value 0
data modify storage cgada:csv i_temp_class_deaths set value 0
data modify storage cgada:csv i_temp_trinket_entries set value 0
data modify storage cgada:csv i_temp_trinket_coins set value 0

# Assemble list of trinkets
scoreboard players set CGADA_IDX num 1
function cgada:csv_export/print_trinkets_list_loop {trinket_idx:1}

# Update column and category headers
function cgada:csv_export/print_headers_write with storage cgada:csv

# Iterate through all classes and dump into cgada:csv.s_data
scoreboard players set CGADA_CLASS_IDX num 1
data modify storage cgada:csv_args class_idx set value 1
function cgada:csv_export/print_class_data_loop with storage cgada:csv_args

# Display link
function cgada:csv_export/display_copy_link with storage cgada:csv


# Reset data structure
data modify storage cgada:data class_data set value []
data modify storage cgada:data trinket_data_template set value []
data modify storage cgada:data i_games_played set value 0

# Generate trinket data template
scoreboard players set CGADA_IDX num 0
function cgada:wide_mode/generate_trinket_data_template_loop {idx:0}

# Generate class data (includes trinket selection per class)
scoreboard players set CGADA_IDX num 0
function cgada:wide_mode/generate_class_data_loop {idx:0}

# Initialize temp data register
scoreboard players set CGADA_NUM num 0


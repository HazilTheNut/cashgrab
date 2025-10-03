
# Reset data structure
data modify storage cgada:wide_data class_data set value []
data modify storage cgada:wide_data trinket_data_template set value []

# Generate trinket data template
scoreboard players set CGADA_IDX num 0
function cgada:wide_mode/generate_trinket_data_template_loop {idx:0}

# Generate class data (includes trinket selection per class)
scoreboard players set CGADA_IDX num 0
function cgada:wide_mode/generate_class_data_loop {idx:0}

# Initialize temp data register
scoreboard players set CGADA_NUM num 0



# Reset games played
data modify storage cgada:generic_data i_games_played set value 0

# Initialize data structure
function cgada:wide_mode/generate_data_structure

# Set collection mode
scoreboard players operation NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_WIDE num



# Reset games played
data modify storage cgada:generic_data i_games_played set value 0

# Initialize data structure
data modify storage cgada:long_data entries set value []
scoreboard players set NUM_CGADA_LM_NEXT_IDX num 0

# Set collection mode
scoreboard players operation NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_LONG num


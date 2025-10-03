
# Initialize collection mode
#   0 = Disabled
#   1 = Wide Mode
#   2 = Long Mode
scoreboard players add NUM_CGADA_COLLECTION_MODE num 0

# enum values
scoreboard players set NUM_CGADA_COLLECTION_MODE_NONE num 0
scoreboard players set NUM_CGADA_COLLECTION_MODE_WIDE num 1
scoreboard players set NUM_CGADA_COLLECTION_MODE_LONG num 2

# Next index to insert into for long mode collection
scoreboard players add NUM_CGADA_LM_NEXT_IDX num 0

# Index number into long mode entry array
scoreboard objectives add __cgada_lm_pm_entry_idx dummy


# Wide Mode: If player is entering gameplay, increment entry totals for class and trinket
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_WIDE num if score @a[tag=t_pm_owner,limit=1] activity_state matches 20 run function cgada:wide_mode/pmt_increment_data_argloader {func_increment:"cgada:wide_mode/pmt_increment_entry_totals"}
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_LONG num if score @a[tag=t_pm_owner,limit=1] activity_state matches 20 run function cgada:long_mode/pmt_append_entry_argloader

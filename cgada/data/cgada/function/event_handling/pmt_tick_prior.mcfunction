
# If player is entering gameplay, increment entry totals for class and trinket
execute if score @a[tag=t_pm_owner,limit=1] activity_state matches 20 run function cgada:wide_mode/pmt_increment_data_argloader {func_increment:"cgada:wide_mode/pmt_increment_entry_totals"}

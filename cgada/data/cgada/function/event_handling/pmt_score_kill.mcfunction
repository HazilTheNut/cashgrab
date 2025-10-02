
# If player scores a kill while in gameplay, record it
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_WIDE num if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_player_kills matches 1.. run function cgada:wide_mode/pmt_increment_data_argloader {func_increment:"cgada:wide_mode/pmt_increment_kills_total"}
execute if score NUM_CGADA_COLLECTION_MODE num = NUM_CGADA_COLLECTION_MODE_LONG num if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_player_kills matches 1.. run function cgada:long_mode/pmt_increment_data_argloader {func_increment:"cgada:long_mode/pmt_increment_kills_total"}

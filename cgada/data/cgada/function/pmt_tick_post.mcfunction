
# If player scores a kill while in gameplay, increment class kills total
execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_player_kills matches 1.. run function cgada:pmt_increment_data_argloader {func_increment:"cgada:pmt_increment_kills_total"}

# If player collects coins while in gameplay, increment class coins total
execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_coin_pickup matches 1.. run function cgada:pmt_increment_data_argloader {func_increment:"cgada:pmt_increment_coins_total"}


# If player scores a kill while in gameplay, increment class kills total
#execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_player_kills matches 1.. run tellraw @a[tag=t_debug] [{"text":"pm_record_data: owner: "},{"type":"selector","selector":"@e[tag=t_pm_owner]"}]
execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_player_kills matches 1.. run function cgada:pmt_increment_data_argloader {func_increment:"cgada:pmt_increment_kills_total"}

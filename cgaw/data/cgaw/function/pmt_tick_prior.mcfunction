
# When player transitions to lobby activity_state, set spawnpoint
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 0 run tellraw @a[tag=t_debug,tag=t_pm_owner,limit=1] "Setting spawnpoint for lobby"
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 0 run function cgaw:pmt_spawnpoint_lobby with storage cgaw:world_info lobby_data

# When player transitions to cts activity_state, set spawnpoint
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 10 run tellraw @a[tag=t_debug,tag=t_pm_owner,limit=1] "Setting spawnpoint for cts"
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 10 run function cgaw:pmt_spawnpoint_cts with storage cgaw:runtime active_map

# Handle tutorial dtm handshake
execute unless entity @a[tag=t_pm_owner,limit=1,scores={activity_state=30..39,dtm_tutorial_dest_idx=1..6},tag=dtm_send_to_tutorial] run return 0

execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 1 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.intro
execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 2 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.coins
execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 3 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.toss
execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 4 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.crouch
execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 5 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.passive
execute if score @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx matches 6 run function cgaw:pmt_consume_dtm_send_to_tutorial with storage cgaw:world_info tutorial_data.trinket

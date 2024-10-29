
# When player transitions to lobby activity_state, set spawnpoint
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 0 run tellraw @a[tag=t_pm_owner,limit=1] "Setting spawnpoint for lobby"
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 0 run function cgaw:pmt_spawnpoint_lobby with storage cgaw:world_info lobby_data

# When player transitions to cts activity_state, set spawnpoint
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 10 run tellraw @a[tag=t_pm_owner,limit=1] "Setting spawnpoint for cts"
execute if score DEVELOPER_MODE num matches 0 if score @a[tag=t_pm_owner,limit=1] activity_state matches 10 run function cgaw:pmt_spawnpoint_cts with storage cgaw:runtime active_map

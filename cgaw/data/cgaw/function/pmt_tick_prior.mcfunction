
# When player transitions to lobby activity_state, set spawnpoint
execute if score @a[tag=t_pm_owner,limit=1] activity_state matches 0 run function cgaw:pmt_spawnpoint_lobby with storage cgaw:world_info lobby_data

# When player transitions to cts activity_state, set spawnpoint
execute if score @a[tag=t_pm_owner,limit=1] activity_state matches 10 run function cgaw:pmt_spawnpoint_cts with storage cgaw:runtime active_map

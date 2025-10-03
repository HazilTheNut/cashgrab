# Arguments:
#	entry_idx		: Entry index number

# Record kills scored
$execute store result score CGADA_NUM num run data get storage cgada:long_data entries[$(entry_idx)].i_kills_total 1
$execute store result storage cgada:long_data entries[$(entry_idx)].i_kills_total int 1 run scoreboard players operation CGADA_NUM num += @a[tag=t_pm_owner,limit=1] evl_player_kills

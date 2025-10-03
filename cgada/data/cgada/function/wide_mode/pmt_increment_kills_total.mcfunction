# Arguments:
#	class_idx		: Class index number
#	trinket_idx		: Trinket index number

tellraw @a[tag=t_debug] [{"text":"pmt_increment_kills_total: owner: "},{"type":"selector","selector":"@e[tag=t_pm_owner]"}]

$execute store result score CGADA_NUM num run data get storage cgada:wide_data class_data[$(class_idx)].i_kills_total 1
$execute store result storage cgada:wide_data class_data[$(class_idx)].i_kills_total int 1 run scoreboard players operation CGADA_NUM num += @a[tag=t_pm_owner,limit=1] evl_player_kills

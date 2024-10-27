# Arguments:
#	class_idx		: Class index number
#	trinket_idx		: Trinket index number

$execute store result score CGADA_NUM num run data get storage cgada:data class_data[$(class_idx)].i_coins_total 1
$execute store result storage cgada:data class_data[$(class_idx)].i_coins_total int 1 run scoreboard players operation CGADA_NUM num += @a[tag=t_pm_owner,limit=1] evl_coin_pickup

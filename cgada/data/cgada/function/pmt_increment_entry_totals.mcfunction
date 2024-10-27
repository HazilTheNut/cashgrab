# Arguments:
#	class_idx		: Class index number
#	trinket_idx		: Trinket index number

# Increment class entry total
$execute store result score CGADA_NUM num run data get storage cgada:data class_data[$(class_idx)].i_entry_total 1
$execute store result storage cgada:data class_data[$(class_idx)].i_entry_total int 1 run scoreboard players add CGADA_NUM num 1

# Increment trinket entry total
$execute store result score CGADA_NUM num run data get storage cgada:data class_data[$(class_idx)].trinket_data[$(trinket_idx)].i_entry_total 1
$execute store result storage cgada:data class_data[$(class_idx)].trinket_data[$(trinket_idx)].i_entry_total int 1 run scoreboard players add CGADA_NUM num 1

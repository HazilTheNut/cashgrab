# base/pm_recover_class.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Retrieves player selected class and reloads data from game_info
#
# Arguments:
#	class_id	: 	Index in classes list

$tellraw @a[tag=t_debug] "Recovering class data for idx $(class_id)"

# Set pm's class to owner's class
$scoreboard players set @s __cts_selected_class_idx $(class_id)

# Retrieve data from cashgrab:game_info
$execute if score @s __cts_selected_class_idx < NUM_CTS_CLASSES_LIST_LEN num run data modify entity @s data.class_info set from storage cashgrab:game_info classes[$(class_id)]



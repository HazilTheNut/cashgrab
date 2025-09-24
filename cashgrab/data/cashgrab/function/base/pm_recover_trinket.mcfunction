# base/pm_recover_trinket.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Retrieves player selected trinket and reloads data from game_info
#
# Arguments:
#	trinket_id	: 	Index in trinkets list

$tellraw @a[tag=t_debug] "Recovering trinket data for idx $(trinket_id)"

# Set pm's trinket to owner's trinket
$scoreboard players set @s __cts_selected_trinket_idx $(trinket_id)

# Retrieve data from cashgrab:game_info
$execute if score @s __cts_selected_trinket_idx <= NUM_CTS_TRINKET_ID_MAX num run data modify entity @s data.trinket_info set from storage cashgrab:game_info trinkets[$(trinket_id)]

# base/pm_recover_trinket.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Retrieves player selected trinket and reloads data from game_info
#
# Arguments:
#	trinket_id	: 	Index in trinkets list

# Set pm's class to owner's class
$scoreboard players set @s trinket_id $(trinket_id)

# Retrieve data from cashgrab:game_info
$execute if score @s trinket_id < NUM_CTS_TRINKETS_LIST_LEN num run data modify entity @s data.trinket_info set from storage cashgrab:game_info trinkets[$(trinket_id)]

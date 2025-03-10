# base/cts/pmt_cts_input_trinkets.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Retrieves indexed trinket_id from cashgrab:game_info and stores it on the pm and pm owner
#
# Arguments:
#	trinket_id	: 	Index in trinkets list

$tellraw @a[tag=t_debug] "base/cts/pmt_cts_input_trinkets Selecting trinket idx $(trinket_id)"

# Retrieve data from cashgrab:game_info
$data modify entity @s data.trinket_info set from storage cashgrab:game_info trinkets[$(trinket_id)]

# Set owner's trinket_id
$scoreboard players set @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx $(trinket_id)

# Set pm's trinket_id to owner's trinket_id
$scoreboard players set @s __cts_selected_trinket_idx $(trinket_id)

# Initialize trinket
function cashgrab:trinkets/pmt_trinket_init with entity @s data.trinket_info

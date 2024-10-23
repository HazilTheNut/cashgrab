# base/cts/pmt_cts_input_classes.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Retrieves indexed class id from cashgrab:game_info and stores it on the pm and pm owner
#
# Arguments:
#	class_id	: 	Index in classes list

$tellraw @a[tag=t_debug] "base/cts/pmt_cts_input_classes Selecting class idx $(class_id)"

# Retrieve data from cashgrab:game_info
$data modify entity @s data.class_info set from storage cashgrab:game_info classes[$(class_id)]

# Set owner's class
$scoreboard players set @a[tag=t_pm_owner,limit=1] class $(class_id)

# Set pm's class to owner's class
$scoreboard players set @s class $(class_id)

# Initialize class
function cashgrab:classes/pmt_class_init with entity @s data.class_info


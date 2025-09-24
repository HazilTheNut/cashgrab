# base/cts/pmt_cts_input_classes.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Retrieves indexed class id from cashgrab:game_info and stores it on the pm and pm owner
#
# Arguments:
#	class_id_max	: 	Maximum index in classes list
#	trinket_id_max	: 	Maximum index in trinkets list

$execute store result storage cashgrab:cts_inv_random_args class_id int 1 run random value 1..$(class_id_max)
$execute store result storage cashgrab:cts_inv_random_args trinket_id int 1 run random value 1..$(trinket_id_max)

function cashgrab:base/cts/pmt_cts_input_classes with storage cashgrab:cts_inv_random_args
function cashgrab:base/cts/pmt_cts_input_trinkets with storage cashgrab:cts_inv_random_args
# cts/pmt_cts_inv_classes_icon_argloader_2.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Retrieves indexed class id from cashgrab:game_info and runs cashgrab:cts/pmt_cts_inv_selection_icon
#
# Arguments:
#	class_id	: 	Index in classes list	
#	slot		:	Inventory slot to insert into

# Retrieve data from cashgrab:game_info
$data modify storage cashgrab:cts_inv_class_icon_args func_cts_icon set from storage cashgrab:game_info classes[$(class_id)].func_pmt_cts_icon

function cashgrab:cts/pmt_cts_inv_selection_icon with storage cashgrab:cts_inv_class_icon_args


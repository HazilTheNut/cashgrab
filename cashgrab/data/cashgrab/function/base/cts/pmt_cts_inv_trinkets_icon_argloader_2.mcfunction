# base/cts/pmt_cts_inv_trinkets_icon_arglodaer_2.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Retrieves indexed trinket id from cashgrab:game_info and runs cashgrab:base/cts/pmt_cts_inv_selection_icon
#
# Arguments:
#	trinket_id	: 	Index in trinkets list	
#	slot		:	Inventory slot to insert into

# Retrieve data from cashgrab:game_info
$data modify storage cashgrab:cts_inv_trinket_icon_args func_cts_icon set from storage cashgrab:game_info trinkets[$(trinket_id)].func_pmt_cts_icon

function cashgrab:base/cts/pmt_cts_inv_selection_icon with storage cashgrab:cts_inv_trinket_icon_args


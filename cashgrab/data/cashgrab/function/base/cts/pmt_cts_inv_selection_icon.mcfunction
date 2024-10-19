# base/cts/pmt_cts_inv_selection_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Calls func_cts_icon on slot
#
# Arguments:
#	func_cts_icon	: 	Function that generates the icon	
#	slot			:	Inventory slot to insert into

# Call func_cts_icon on slot
$function $(func_cts_icon) {slot:"$(slot)"}
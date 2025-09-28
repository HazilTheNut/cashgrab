# trinkets/pmt_trinket_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges			: Number of charges remaining
#	slot			: Slot to insert item
#	func_pmt_inv	: Inventory loader function for trinket

$function $(func_pmt_inv) {charges:$(charges),slot:"$(slot)",charges_max:$(charges_max)}

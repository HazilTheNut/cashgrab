# classes/pmt_class_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	+ charges of ability stored in cashgrab:abi_args
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	func_pmt_inv_ability_icon	: Class ability icon function

$function $(func_pmt_inv_ability_icon) with storage cashgrab:abi_args

# trinkets/pmt_trinket_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes trinket and its starting charges based on owner's trinket_id
#
# Arguments:
#	func_pmt_init	: trinket init function

# Branch execution based on equipped trinket
$function $(func_pmt_init)

# Copy charge count to prev
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges

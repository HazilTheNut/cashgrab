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

# Reset trinket variables
scoreboard players set @a[tag=t_pm_owner] tv_A 0
scoreboard players set @a[tag=t_pm_owner] tv_B 0
scoreboard players set @a[tag=t_pm_owner] tv_C 0
scoreboard players set @a[tag=t_pm_owner] tv_D 0

# Branch execution based on equipped trinket
$function $(func_pmt_init)

# Copy charge count to prev
scoreboard players operation @a[tag=t_pm_owner,limit=1] __trinket_charges_prev = @a[tag=t_pm_owner,limit=1] trinket_charges

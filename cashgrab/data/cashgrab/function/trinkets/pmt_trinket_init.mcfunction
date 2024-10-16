# trinkets/pmt_trinket_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes trinket and its starting charges based on owner's trinket_id
#
# Arguments: (none)

# Branch execution based on trinket_id
execute if score @a[tag=t_pm_owner,limit=1] trinket_id matches -1 run function cashgrab:trinkets/test_item/pmt_test_item_init

execute if score @a[tag=t_pm_owner,limit=1] trinket_id matches 1 run function cashgrab:trinkets/vigor_flask/pmt_vigor_flask_init

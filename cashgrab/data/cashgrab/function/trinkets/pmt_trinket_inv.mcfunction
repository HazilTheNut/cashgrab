# trinkets/pmt_trinket_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges		: Number of charges remaining
#	slot		: Slot to insert item

$execute if score @a[tag=t_pm_owner,limit=1] trinket_id matches -1 run function cashgrab:trinkets/test_item/pmt_test_item_inv {charges:$(charges),slot:"$(slot)"}

$execute if score @a[tag=t_pm_owner,limit=1] trinket_id matches 1 run function cashgrab:trinkets/vigor_flask/pmt_vigor_flask_inv {charges:$(charges),slot:"$(slot)"}

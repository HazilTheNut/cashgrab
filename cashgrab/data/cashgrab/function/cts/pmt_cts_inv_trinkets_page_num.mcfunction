# cts/pmt_cts_inv_trinkets_page_num.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon item for class page number
#
# Arguments:
#	slot				:	Inventory slot to insert into
#	trinkets_page_num	:	Trinkets Page number to display

$execute if score NUM_CTS_TRINKETS_PAGE_IDX_MAX num matches ..0 run function cashgrab:cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}

execute if score NUM_CTS_TRINKETS_PAGE_IDX_MAX num matches ..0 run return 0

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:paper[\
minecraft:item_name="[{\"color\":\"gold\",\"italic\":false,\"text\":\"Page $(trinkets_page_num)\"}]"\
] $(trinkets_page_num)

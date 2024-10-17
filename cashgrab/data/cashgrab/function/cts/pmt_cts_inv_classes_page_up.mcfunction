# cts/pmt_cts_inv_classes_page_up.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon item for class page up selection
#
# Arguments:
#	slot	:	Inventory slot to insert into

$execute if score @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx matches 1.. run item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:iron_nugget[\
minecraft:item_name="[{\"color\":\"gold\",\"italic\":false,\"text\":\"<Prev Page>\"}]"\
] 1

execute if score @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx matches 1.. run return 0

$function cashgrab:cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}

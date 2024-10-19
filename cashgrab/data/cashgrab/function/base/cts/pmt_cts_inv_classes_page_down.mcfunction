# base/cts/pmt_cts_inv_classes_page_down.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon item for class page down selection
#
# Arguments:
#	slot	:	Inventory slot to insert into

$execute if score @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx < NUM_CTS_CLASSES_PAGE_IDX_MAX num run item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:glass_pane[\
minecraft:item_name="[{\"color\":\"gold\",\"italic\":false,\"text\":\"<Next Page>\"}]"\
] 1

execute if score @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx < NUM_CTS_CLASSES_PAGE_IDX_MAX num run return 0

$function cashgrab:base/cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}

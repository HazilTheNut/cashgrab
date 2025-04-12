# base/cts/pmt_cts_inv_class_page_up.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon item for class page up selection
#
# Arguments:
#	slot	:	Inventory slot to insert into

$execute if score @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx matches 1.. run item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:glass_pane[\
minecraft:item_name=[{color:"gold",italic:false,text:"<Prev Page>"}]\
] 1

execute if score @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx matches 1.. run return 0

$function cashgrab:base/cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}

# base/cts/pmt_cts_inv_classes_page_num.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon item for class page number
#
# Arguments:
#	slot					:	Inventory slot to insert into
#	classes_page_num		:	Classes Page number to display
#	classes_page_num_max	:	Max Classes Page number to display

#$tellraw @a[tag=t_pm_owner,limit=1,tag=t_debug] "Max class page: $(classes_page_num_max)"

$execute if score NUM_CTS_CLASSES_PAGE_IDX_MAX num matches ..0 run function cashgrab:base/cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}

execute if score NUM_CTS_CLASSES_PAGE_IDX_MAX num matches ..0 run return 0

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:gray_stained_glass_pane[\
minecraft:item_name="[{\"color\":\"gold\",\"italic\":false,\"text\":\"Page $(classes_page_num) / $(classes_page_num_max)\"}]"\
] $(classes_page_num)

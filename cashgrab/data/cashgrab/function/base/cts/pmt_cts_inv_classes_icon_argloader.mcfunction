# base/cts/pmt_cts_inv_classes_icon_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Entry point for displaying class icon
#
# Arguments:
#	slot		:	Inventory slot to insert into
#	local_idx	:	Index local to page; used to calculate class_id = (page_idx * page_size) + local_idx

#$tellraw @a[tag=t_debug] "cts/pmt_cts_inv_classes_icon_argloader: slot: $(slot); local_idx: $(local_idx)"

# Calculate class id
scoreboard players operation @a[tag=t_pm_owner,limit=1] temp_A = @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx
scoreboard players operation @a[tag=t_pm_owner,limit=1] temp_A *= NUM_CTS_CLASSES_PAGE_SIZE num

# Store class id as argument
$execute store result storage cashgrab:cts_inv_class_icon_args class_id int 1 run scoreboard players add @a[tag=t_pm_owner,limit=1] temp_A $(local_idx)

# Store slot as argument
$data modify storage cashgrab:cts_inv_class_icon_args slot set value "$(slot)"

# Show blank if out of bounds of array
$execute if score @a[tag=t_pm_owner,limit=1] temp_A > NUM_CTS_CLASS_ID_MAX num run function cashgrab:base/cts/pmt_cts_inv_icon_blank {slot:"$(slot)"}
execute if score @a[tag=t_pm_owner,limit=1] temp_A > NUM_CTS_CLASS_ID_MAX num run return 0

# Display class icon
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader_2 with storage cashgrab:cts_inv_class_icon_args

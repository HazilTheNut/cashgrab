# cts/pmt_cts_inv_draw.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inventory draw function for class-and-trinket selection
#
# Arguments: 
#	classes_page_num	:	Classes Page number to display
#	trinkets_page_num	:	Trinkets Page number to display

#tellraw @a[tag=t_pm_owner,tag=t_debug] "cts/pmt_cts_inv_draw"

# Column 0 : classes page selection
function cashgrab:cts/pmt_cts_inv_classes_page_up {slot:"inventory.0"}
$function cashgrab:cts/pmt_cts_inv_classes_page_num {slot:"inventory.9",classes_page_num:$(classes_page_num)}
function cashgrab:cts/pmt_cts_inv_classes_page_down {slot:"inventory.18"}

# Columns 1-5 : classes selection
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.1",local_idx:1}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.2",local_idx:2}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.3",local_idx:3}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.4",local_idx:4}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.5",local_idx:5}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.10",local_idx:6}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.11",local_idx:7}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.12",local_idx:8}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.13",local_idx:9}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.14",local_idx:10}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.19",local_idx:11}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.20",local_idx:12}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.21",local_idx:13}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.22",local_idx:14}
function cashgrab:cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.23",local_idx:15}

# Column 6 : trinkets page selection
function cashgrab:cts/pmt_cts_inv_trinkets_page_up {slot:"inventory.6"}
$function cashgrab:cts/pmt_cts_inv_trinkets_page_num {slot:"inventory.15",trinkets_page_num:$(trinkets_page_num)}
function cashgrab:cts/pmt_cts_inv_trinkets_page_down {slot:"inventory.24"}

# Columns 7-8 : trinkets selection
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.7",local_idx:1}
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.8",local_idx:2}
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.16",local_idx:3}
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.17",local_idx:4}
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.25",local_idx:5}
function cashgrab:cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.26",local_idx:6}

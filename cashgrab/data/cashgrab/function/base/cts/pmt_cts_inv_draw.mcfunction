# base/cts/pmt_cts_inv_draw.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inventory draw function for class-and-trinket selection
#
# Arguments: 
#	classes_page_num		:	Classes Page number to display
#	classes_page_num_max	:	Max Classes Page number to display
#	trinkets_page_num		:	Trinkets Page number to display
#	trinkets_page_num_max	:	Max Trinkets Page number to display

#tellraw @a[tag=t_pm_owner,tag=t_debug] "cts/pmt_cts_inv_draw"

# Column 0 : miscellaneous options
function cashgrab:base/cts/pmt_cts_inv_icon_random {slot:"inventory.0"}
function cashgrab:base/cts/pmt_cts_inv_icon_trinket_pos {slot:"inventory.9"}
function cashgrab:base/cts/pmt_cts_inv_icon_blank {slot:"inventory.18"}

# Column 1 : classes page selection
function cashgrab:base/cts/pmt_cts_inv_classes_page_up {slot:"inventory.1"}
$function cashgrab:base/cts/pmt_cts_inv_classes_page_num {slot:"inventory.10",classes_page_num:$(classes_page_num),classes_page_num_max:$(classes_page_num_max)}
function cashgrab:base/cts/pmt_cts_inv_classes_page_down {slot:"inventory.19"}

# Columns 2-5 : classes selection
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.2",local_idx:1}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.3",local_idx:2}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.4",local_idx:3}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.5",local_idx:4}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.11",local_idx:5}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.12",local_idx:6}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.13",local_idx:7}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.14",local_idx:8}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.20",local_idx:9}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.21",local_idx:10}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.22",local_idx:11}
function cashgrab:base/cts/pmt_cts_inv_classes_icon_argloader {slot:"inventory.23",local_idx:12}

# Column 6 : trinkets page selection
function cashgrab:base/cts/pmt_cts_inv_trinkets_page_up {slot:"inventory.6"}
$function cashgrab:base/cts/pmt_cts_inv_trinkets_page_num {slot:"inventory.15",trinkets_page_num:$(trinkets_page_num),trinkets_page_num_max:$(trinkets_page_num_max)}
function cashgrab:base/cts/pmt_cts_inv_trinkets_page_down {slot:"inventory.24"}

# Columns 7-8 : trinkets selection
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.7",local_idx:1}
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.8",local_idx:2}
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.16",local_idx:3}
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.17",local_idx:4}
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.25",local_idx:5}
function cashgrab:base/cts/pmt_cts_inv_trinkets_icon_argloader {slot:"inventory.26",local_idx:6}

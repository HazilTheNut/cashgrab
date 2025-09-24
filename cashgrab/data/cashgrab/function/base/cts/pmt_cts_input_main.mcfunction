# base/cts/pmt_cts_input_main.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Top-level inventory draw function for class-and-trinket selection
#
# Arguments: (none)

#tellraw @a[tag=t_pm_owner,tag=t_debug] "cts/pmt_cts_input_main"

# Remove tag t_cts_input_found if leftover
tag @a[tag=t_pm_owner,limit=1] remove t_cts_input_found

# --- Collect input from player. Each of the functions below add tag t_cts_input_found to pm owner if they are ran

# Column 0 : miscellaneous options
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.0 * run function cashgrab:base/cts/pmt_cts_input_random
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.9 * run function cashgrab:base/cts/pmt_cts_input_noop
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.18 * run function cashgrab:base/cts/pmt_cts_input_noop

# Column 1 : classes page selection
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.1 * run function cashgrab:base/cts/pmt_cts_input_classes_page_up
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.10 * run function cashgrab:base/cts/pmt_cts_input_noop
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.19 * run function cashgrab:base/cts/pmt_cts_input_classes_page_down

# Columns 2-5 : classes selection
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.2 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:1}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.3 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:2}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.4 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:3}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.5 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:4}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.11 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:5}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.12 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:6}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.13 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:7}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.14 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:8}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.20 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:9}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.21 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:10}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.22 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:11}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.23 * run function cashgrab:base/cts/pmt_cts_input_classes_argloader {local_idx:12}

# Column 6 : trinkets page selection
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.6 * run function cashgrab:base/cts/pmt_cts_input_trinkets_page_up
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.15 * run function cashgrab:base/cts/pmt_cts_input_noop
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.24 * run function cashgrab:base/cts/pmt_cts_input_trinkets_page_down

# Columns 7-8 : trinkets selection
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.7 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:1}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.8 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:2}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.16 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:3}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.17 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:4}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.25 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:5}
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.26 * run function cashgrab:base/cts/pmt_cts_input_trinkets_argloader {local_idx:6}

# If any items in inventory are removed, clear player and redraw
execute if entity @a[tag=t_cts_input_found] run clear @a[tag=t_pm_owner,limit=1]
execute if entity @a[tag=t_cts_input_found] run function cashgrab:util/pmt_inv_refresh
tag @a[tag=t_pm_owner,limit=1] remove t_cts_input_found

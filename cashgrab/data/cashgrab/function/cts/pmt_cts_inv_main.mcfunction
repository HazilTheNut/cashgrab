# cts/pmt_cts_inv_main.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Top-level inventory draw function for class-and-trinket selection
#
# Arguments: (none)

tellraw @a[tag=t_pm_owner,tag=t_debug] "cts/pmt_cts_inv_main"

# Calculate page numbers from page indices
scoreboard players operation @a[tag=t_pm_owner,limit=1] __cts_classes_page_num = @a[tag=t_pm_owner,limit=1] __cts_classes_page_idx
scoreboard players add @a[tag=t_pm_owner,limit=1] __cts_classes_page_num 1
execute store result storage cashgrab:cts_inv_args classes_page_num int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_classes_page_num

scoreboard players operation @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_num = @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx
scoreboard players add @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_num 1
execute store result storage cashgrab:cts_inv_args trinkets_page_num int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_num

# Draw inventory
function cashgrab:cts/pmt_cts_inv_draw with storage cashgrab:cts_inv_args

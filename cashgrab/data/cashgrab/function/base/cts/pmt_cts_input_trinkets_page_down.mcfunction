# base/cts/pmt_cts_input_trinkets_page_down.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Class-and-trinket selection trinkets page down input collector function
#
# Arguments: (none)

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found

# Increment trinkets page index
scoreboard players add @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx 1

# Page index upper bound
execute if score @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx > NUM_CTS_TRINKETS_PAGE_IDX_MAX num run scoreboard players operation @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx = NUM_CTS_TRINKETS_PAGE_IDX_MAX num

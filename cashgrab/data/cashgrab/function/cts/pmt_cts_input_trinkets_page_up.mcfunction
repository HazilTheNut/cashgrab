# cts/pmt_cts_input_noop.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Class-and-trinket selection "no op" input collector function
#
# Arguments: (none)

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found

# Decrement trinkets page index
scoreboard players remove @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx 1

# Page index lower bound
execute if score @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx matches ..-1 run scoreboard players set @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx 0

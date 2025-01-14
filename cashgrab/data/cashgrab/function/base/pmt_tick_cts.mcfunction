# base/pmt_tick_cts.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Class-and-Trinket Select activity_state
#
# Arguments: (none)

# Run toss ability code
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_ability

# Get input from inventory menu
function cashgrab:base/cts/pmt_cts_input_main
function cashgrab:base/pmt_trinket_cts_tick

# Run cts tick function for class
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:classes/pmtl_class_cts_tick with entity @s data.class_info


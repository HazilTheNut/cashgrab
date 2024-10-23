# base/pmt_tick_transition_to_cts.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Transition to Class-and-Trinket Select activity_state
#
# Arguments: (none)

# Clear inventory (including armor which typically isn't cleared)
clear @a[tag=t_pm_owner,limit=1]

# Initialize trinket and class - they should look like what it would look like to start gameplay with those options
function cashgrab:trinkets/pmt_trinket_init with entity @s data.trinket_info
function cashgrab:classes/pmt_class_init with entity @s data.class_info

# Move to Class-and-Trinket Select activity_state
scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 11

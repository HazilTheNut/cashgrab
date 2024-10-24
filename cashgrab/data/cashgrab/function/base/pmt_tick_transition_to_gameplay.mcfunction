# base/pmt_tick_transition_to_gameplay.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Transition to Gameplay activity_state
#
# Arguments: (none)

# If player selections are out of bounds, reset cts selection
execute if score @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx >= NUM_CTS_CLASSES_LIST_LEN num run function cashgrab:base/pmt_reset_cts
execute if score @a[tag=t_pm_owner,limit=1] __cts_selected_class_idx matches ..0 run function cashgrab:base/pmt_reset_cts
execute if score @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx >= NUM_CTS_TRINKETS_LIST_LEN num run function cashgrab:base/pmt_reset_cts
execute if score @a[tag=t_pm_owner,limit=1] __cts_selected_trinket_idx matches ..0 run function cashgrab:base/pmt_reset_cts

# Initialize class and trinket
function cashgrab:trinkets/pmt_trinket_init with entity @s data.trinket_info
function cashgrab:classes/pmt_class_init with entity @s data.class_info

# Move to Gameplay state
scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 21

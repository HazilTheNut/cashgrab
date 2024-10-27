# base/cts/pmt_cts_input_trinkets_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Loads arguments for and runs cashgrab:base/cts/pmt_cts_input_trinkets
#
# Arguments: (none)

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found

# Calculate trinket id
scoreboard players operation @a[tag=t_pm_owner,limit=1] temp_A = @a[tag=t_pm_owner,limit=1] __cts_trinkets_page_idx
scoreboard players operation @a[tag=t_pm_owner,limit=1] temp_A *= NUM_CTS_TRINKETS_PAGE_SIZE num

# Store trinket id as argument
$execute store result storage cashgrab:cts_trinket_select_args trinket_id int 1 run scoreboard players add @a[tag=t_pm_owner,limit=1] temp_A $(local_idx)

# Import data from cashgrab:game_info if within bounds of array
execute if score @a[tag=t_pm_owner,limit=1,scores={temp_A=1..}] temp_A < NUM_CTS_TRINKETS_LIST_LEN num run function cashgrab:base/cts/pmt_cts_input_trinkets with storage cashgrab:cts_trinket_select_args

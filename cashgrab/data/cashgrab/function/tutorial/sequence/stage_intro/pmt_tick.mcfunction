# tutorial/sequence/stage_/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# If player consumes exit item, exit tutorial via reinitializing the player
execute if score @a[tag=t_pm_owner,limit=1] evc_barriers matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] reinitialize 1
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_barriers 0

# Check if player requests further progress
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_progress_request matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx 11
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_progress_request matches 1 run function cashgrab:tutorial/pmt_sequence_init

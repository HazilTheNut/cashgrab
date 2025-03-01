# tutorial/sequence/stage_passive/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Check if player requests further progress
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_progress_request matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 51

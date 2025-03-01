# tutorial/sequence/stage_trinket_end/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Check if player requests further progress
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_progress_request matches 1 run function cashgrab:tutorial/pmt_sequence_end


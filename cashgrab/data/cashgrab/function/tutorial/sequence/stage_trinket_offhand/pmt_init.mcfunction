# tutorial/sequence/stage_trinket_offhand/pmt_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes current tutorial sequence stage
#
# Arguments: (none)

# Set Trainee class progress
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress 5

# Set Tutorial destination
scoreboard players set @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx 6

# Set Trinket to hotbar so this stage and the previous cannot be completed simultaneously
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 0

# Restore health
effect give @a[tag=t_pm_owner,limit=1] minecraft:regeneration 5 20 true

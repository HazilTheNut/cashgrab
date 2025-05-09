# tutorial/sequence/stage_coins_end/pmt_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes current tutorial sequence stage
#
# Arguments: (none)

# Set Trainee class progress
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress 0

# Set Tutorial destination
scoreboard players set @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx 2

# Revoke trinket
tag @a[tag=t_pm_owner,limit=1] add t_trinket_revoke

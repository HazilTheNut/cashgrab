# tutorial/sequence/stage_trinket/pmt_init.mcfunction
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

# Teleport player
tag @a[tag=t_pm_owner,limit=1] add dtm_send_to_tutorial

# Grant trinket
tag @a[tag=t_pm_owner,limit=1] add t_trinket_replenish

# Restore health
effect give @a[tag=t_pm_owner,limit=1] minecraft:regeneration 5 20 true

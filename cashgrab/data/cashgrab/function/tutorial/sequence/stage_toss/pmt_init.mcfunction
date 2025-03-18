# tutorial/sequence/stage_toss/pmt_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes current tutorial sequence stage
#
# Arguments: (none)

# Set Trainee class progress
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress 2

# Set Tutorial destination
scoreboard players set @a[tag=t_pm_owner,limit=1] dtm_tutorial_dest_idx 3

# Revoke trinket
tag @a[tag=t_pm_owner,limit=1] add t_trinket_revoke

# Initialize ability cooldown
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cd_tickrate 50
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 5000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cd_ms 0

# Restore health
effect give @a[tag=t_pm_owner,limit=1] minecraft:regeneration 5 20 true

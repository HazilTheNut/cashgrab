# tutorial/pmt_sequence_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes current tutorial sequence stage
#
# Arguments: (none)

# Reset scoreboard values
scoreboard players set @a[tag=t_pm_owner,limit=1] coins 0

scoreboard players reset @a[tag=t_pm_owner,limit=1] __tutorial_other_request
scoreboard players reset @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request
scoreboard players reset @a[tag=t_pm_owner,limit=1] __tutorial_progress_request

# Set spawnpoint and tag player for map teleportation
execute if score DEVELOPER_MODE num matches 0 run spawnpoint @a[tag=t_pm_owner,limit=1] 0 100 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run tag @a[tag=t_pm_owner,limit=1] add dtm_send_to_lobby
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run tag @a[tag=t_pm_owner,limit=1] add dtm_send_to_cts
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 10
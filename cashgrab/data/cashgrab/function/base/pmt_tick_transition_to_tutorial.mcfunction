# base/pmt_tick_transition_to_tutorial.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Transition to Tutorial activity_state
#
# Arguments: (none)

clear @a[tag=t_pm_owner,limit=1]
effect clear @a[tag=t_pm_owner,limit=1]

# Set player gamemode
execute if score DEVELOPER_MODE num matches 0 run gamemode adventure @a[tag=t_pm_owner,limit=1]

# Move player team
team join team_lobby @a[tag=t_pm_owner,limit=1]

# Reset coin counter
scoreboard players set @a[tag=t_pm_owner,limit=1] coins 0

# Equip Vigor Flask trinket
function cashgrab:base/cts/pmt_cts_input_trinkets {trinket_id:1}

# Initialize tutorial
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx 1
function cashgrab:tutorial/pmt_sequence_init

# Move to Tutorial activity_state
scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 31

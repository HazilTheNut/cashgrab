# tutorial/pmt_sequence_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes current tutorial sequence stage
#
# Arguments: (none)

# Initialize current tutorial sequence stage
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 1 run function cashgrab:tutorial/sequence/stage_intro/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 11 run function cashgrab:tutorial/sequence/stage_coins/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 12 run function cashgrab:tutorial/sequence/stage_coins_healing/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 13 run function cashgrab:tutorial/sequence/stage_coins_end/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 21 run function cashgrab:tutorial/sequence/stage_toss_select_trainee/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 22 run function cashgrab:tutorial/sequence/stage_toss/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 31 run function cashgrab:tutorial/sequence/stage_crouch/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 41 run function cashgrab:tutorial/sequence/stage_passive/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 51 run function cashgrab:tutorial/sequence/stage_trinket/pmt_init
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 52 run function cashgrab:tutorial/sequence/stage_trinket_end/pmt_init

# Send chat message
function cashgrab:tutorial/pmt_send_message

# Enable player input
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_other_request 0
scoreboard players enable @a[tag=t_pm_owner,limit=1] __tutorial_other_request
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request 0
scoreboard players enable @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_progress_request 0
scoreboard players enable @a[tag=t_pm_owner,limit=1] __tutorial_progress_request

# Set player gamemode
execute if score DEVELOPER_MODE num matches 0 run gamemode adventure @a[tag=t_pm_owner,limit=1]

# Restore hunger
effect give @a[tag=t_pm_owner,limit=1] minecraft:saturation 15 1 true

# Refresh inventory
function cashgrab:util/pmt_inv_refresh

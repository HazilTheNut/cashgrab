# tutorial/pmt_sequence_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Execute tutorial sequence stage tick function
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 1 run function cashgrab:tutorial/sequence/stage_intro/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 11 run function cashgrab:tutorial/sequence/stage_coins/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 12 run function cashgrab:tutorial/sequence/stage_coins_healing/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 13 run function cashgrab:tutorial/sequence/stage_coins_end/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 21 run function cashgrab:tutorial/sequence/stage_toss_select_trainee/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 22 run function cashgrab:tutorial/sequence/stage_toss/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 31 run function cashgrab:tutorial/sequence/stage_crouch/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 41 run function cashgrab:tutorial/sequence/stage_passive/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 51 run function cashgrab:tutorial/sequence/stage_trinket/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 52 run function cashgrab:tutorial/sequence/stage_trinket_offhand/pmt_tick
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 53 run function cashgrab:tutorial/sequence/stage_trinket_end/pmt_tick

# Progress to next sequence index if set
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx matches 1.. run scoreboard players operation @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx = @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx matches 1.. run function cashgrab:tutorial/pmt_sequence_init
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 0

# If player requests a transcript, grant it
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request matches 1.. run function cashgrab:tutorial/pmt_give_transcript
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request 0
scoreboard players enable @a[tag=t_pm_owner,limit=1] __tutorial_transcript_request

# Handle other player requests
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_other_request matches 1 unless score @a[tag=t_pm_owner,limit=1] stat_hp matches ..19 run effect give @a[tag=t_pm_owner,limit=1] minecraft:instant_damage
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_other_request matches 2 run tag @a[tag=t_pm_owner,limit=1] add t_trinket_replenish
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_other_request matches 3 run function cashgrab:tutorial/pmt_send_message
scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_other_request 0
scoreboard players enable @a[tag=t_pm_owner,limit=1] __tutorial_other_request

# If player's coins exceeds 10, cap it
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={coins=101..}] coins 100

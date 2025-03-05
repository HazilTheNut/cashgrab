# tutorial/pmt_send_message.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Sends chat message based on current tutorial sequence stage
#
# Arguments: (none)

execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 1 run function cashgrab:tutorial/sequence/stage_intro/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 11 run function cashgrab:tutorial/sequence/stage_coins/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 12 run function cashgrab:tutorial/sequence/stage_coins_healing/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 13 run function cashgrab:tutorial/sequence/stage_coins_end/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 21 run function cashgrab:tutorial/sequence/stage_toss_select_trainee/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 22 run function cashgrab:tutorial/sequence/stage_toss/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 31 run function cashgrab:tutorial/sequence/stage_crouch/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 41 run function cashgrab:tutorial/sequence/stage_passive/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 51 run function cashgrab:tutorial/sequence/stage_trinket/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 52 run function cashgrab:tutorial/sequence/stage_trinket_offhand/pmt_send_message
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_seq_idx matches 53 run function cashgrab:tutorial/sequence/stage_trinket_end/pmt_send_message

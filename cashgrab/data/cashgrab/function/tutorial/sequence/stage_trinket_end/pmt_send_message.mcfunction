# tutorial/sequence/stage_trinket_end/pmt_send_message.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Sends chat message for current tutorial sequence stage
#
# Arguments: (none)

tellraw @a[tag=t_pm_owner,limit=1] [\
{"color":"dark_gray","text":"\n--------------------------------------------"},\
{"color":"green","text":"\nYou have completed the tutorial!"},\
{"color":"yellow","text":"\n\nTo exit, click on the sign in the back of the room."}\
]

# tutorial/sequence/stage_/pmt_send_message.mcfunction
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
{"color":"white","text":"\nThe main objective of the game is to "},\
{"color":"gold","text":"collect coins"},\
{"color":"white","text":". You can do so by "},\
{"color":"gold","text":"stepping on gold pressure plates"},\
{"color":"white","text":", such as the one up ahead."},\
{"color":"gray","text":"\n\nWhen you die during gameplay, you will drop half your stash of coins on the ground (not shown in the tutorial)."},\
{"color":"yellow","text":"\n\nTo continue, collect some coins."}\
]

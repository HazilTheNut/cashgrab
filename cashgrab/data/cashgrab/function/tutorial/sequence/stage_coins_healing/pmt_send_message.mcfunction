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
{"color":"white","text":"\nIn addition to scoring points, "},\
{"color":"gold","text":"collect coins"},\
{"color":"white","text":" also "},\
{"color":"gold","text":"heals you."},\
{"color":"yellow","text":"\n\nTo continue, take damage from the sign and then collect some coins."}\
]

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
{"color":"white","text":"\nSome Classes may have a "},\
{"color":"aqua","text":"Passive Ability"},\
{"color":"white","text":" that is active"},\
{"color":"gold","text":" passively"},\
{"color":"white","text":"."},\
{"color":"white","text":"\n\nYour "},\
{"color":"aqua","text":"Passive Ability"},\
{"color":"white","text":" has no effect."},\
{"color":"yellow","text":"\n\nTo continue, head to the next area."}\
]

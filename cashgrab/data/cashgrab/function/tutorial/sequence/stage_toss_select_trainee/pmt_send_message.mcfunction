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
{"color":"white","text":"\nIn Cash Grab Arena, there are many different "},\
{"color":"aqua","text":"Classes"},\
{"color":"white","text":" you can equip, each with their own unique items and abilities."},\
{"color":"white","text":"\n\nFor the tutorial, you can equip the "},\
{"color":"aqua","text":"Trainee"},\
{"color":"white","text":" Class by "},\
{"color":"gold","text":"clicking on it in your inventory"},\
{"color":"white","text":"."},\
{"color":"yellow","text":"\n\nTo continue, equip the Trainee class."}\
]

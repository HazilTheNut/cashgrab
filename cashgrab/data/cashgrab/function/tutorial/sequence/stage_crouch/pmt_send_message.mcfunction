# tutorial/sequence/stage_crouch/pmt_send_message.mcfunction
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
{"color":"aqua","text":"Crouch Ability"},\
{"color":"white","text":" that activates by"},\
{"color":"gold","text":" crouching or sneaking."},\
{"color":"white","text":" During the tutorial, "},\
{"underlined":true,"color":"gold","text":"you must be holding your weapon to activate this ability"},\
{"color":"white","text":"."},\
{"color":"white","text":"\n\nYour "},\
{"color":"aqua","text":"Crouch Ability"},\
{"color":"white","text":" is adapted from the Ranger's "},\
{"color":"aqua","text":"Wall Climb"},\
{"color":"white","text":", which allows you to climb up walls."},\
{"color":"yellow","text":"\n\nTo continue, reach the end of the next area."}\
]

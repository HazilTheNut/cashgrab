# tutorial/sequence/stage_toss/pmt_send_message.mcfunction
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
{"color":"white","text":"\nAll Classes have a "},\
{"color":"aqua","text":"Toss Ability"},\
{"color":"white","text":" that activates when you"},\
{"color":"gold","text":" drop any item"},\
{"color":"white","text":". During the tutorial, "},\
{"underlined":true,"color":"gold","text":"you must drop your weapon to activate this ability"},\
{"color":"white","text":"."},\
{"color":"white","text":"\n\nYour "},\
{"color":"aqua","text":"Toss Ability"},\
{"color":"white","text":" is adapted from the Spectre's "},\
{"color":"aqua","text":"Blink"},\
{"color":"white","text":", which is a short-range teleport."},\
{"color":"yellow","text":"\n\nTo continue, reach the end of the next area."}\
]

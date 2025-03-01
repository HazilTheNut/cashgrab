# tutorial/sequence/stage_intro/pmt_send_message.mcfunction
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
{"color":"white","text":"\nWelcome to the Cash Grab Arena tutorial!"},\
{"color":"gray","text":"\nIf this was a misclick, use the "},\
{"color":"aqua","text":"Return"},\
{"color":"gray","text":" item on your hotbar."},\
{"color":"yellow","text":"\n\nTo continue, head to the next area."},\
{"color":"gray","text":"\n\nYou may need to "},\
{"color":"gold","text":"set your Chat Settings > Unfocused Height to 75px"},\
{"color":"gray","text":" or "},\
{"color":"gold","text":"pick up a transcript"},\
{"color":"gray","text":" from a nearby sign for the best experience."}\
]

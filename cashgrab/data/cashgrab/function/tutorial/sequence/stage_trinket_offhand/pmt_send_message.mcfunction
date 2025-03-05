# tutorial/sequence/stage_trinket_offhand/pmt_send_message.mcfunction
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
{"color":"white","text":"\nYou usually are not able to regain your Trinkets after using them, though you can here by "},\
{"color":"gold","text":"clicking on the sign nearby"},\
{"color":"white","text":"."},\
{"color":"white","text":"\n\nFor quicker access, you can often"},\
{"color":"gold","text":" put your Trinket in your offhand slot"},\
{"color":"white","text":"."},\
{"color":"gray","text":"\n(This may not be fully supported on all Classes)"},\
{"color":"yellow","text":"\n\nTo continue, put your Vigor Flask in your offhand and drink it."}\
]

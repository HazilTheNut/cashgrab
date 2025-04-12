# tutorial/sequence/stage_trinket/pmt_send_message.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Sends chat message for current tutorial sequence stage
#
# Arguments: (none)

tellraw @a[tag=t_pm_owner,limit=1] [\
{color:"dark_gray",text:"\n--------------------------------------------"},\
{color:"white",text:"\nIn addition to your Class, you can equip many different "},\
{color:"aqua",text:"Trinkets"},\
{color:"white",text:", which are single or limited use items."},\
{color:"white",text:"\n\nYou currently have the "},\
{color:"aqua",text:"Vigor Flask"},\
{color:"white",text:" Trinket equipped."},\
{color:"yellow",text:"\n\nTo continue, drink your Vigor Flask."}\
]

# tutorial/sequence/stage_coins_end/pmt_send_message.mcfunction
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
{color:"yellow",text:"\n\nTo continue, head to the next area."}\
]


# tutorial/sequence/stage_/pmt_give_transcript.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Grants transcript item for the current tutorial sequence stage
#
# Arguments: (none)

give @a[tag=t_pm_owner,limit=1] minecraft:paper[\
minecraft:item_name="{\"color\":\"aqua\",\"italic\":false,\"text\":\"Transcript\"}",\
minecraft:lore=[\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"--------------------------------------------\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"Some Classes may have a \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Passive Ability\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" that is active \"},{\"italic\":false,\"color\":\"gold\",\"text\":\"passively\"},{\"italic\":false,\"color\":\"white\",\"text\":\".\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"Your \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Passive Ability\"},{\"italic\":false,\"color\":\"white\",\"text\":\" has no effect.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, head to the next area.\"}"\
]\
] 1

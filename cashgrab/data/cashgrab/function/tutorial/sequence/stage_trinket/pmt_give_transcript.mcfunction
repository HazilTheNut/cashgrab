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
"[{\"italic\":false,\"color\":\"white\",\"text\":\"In addition to your Class, you can equip\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" many different \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Trinkets\"},{\"italic\":false,\"color\":\"white\",\"text\":\", which are single\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" or limited use items.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"You have the \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Vigor Flask\"},{\"italic\":false,\"color\":\"white\",\"text\":\" Trinket Equipped.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, drink your Vigor Flask.\"}"\
]\
] 1

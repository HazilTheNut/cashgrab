# tutorial/sequence/stage_coins_healing/pmt_give_transcript.mcfunction
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
"[{\"italic\":false,\"color\":\"white\",\"text\":\"In addition to scoring points, \"},{\"italic\":false,\"color\":\"gold\",\"text\":\"collecting coins\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" also \"},{\"color\":\"gold\",\"text\":\"heals you\"},{\"italic\":false,\"color\":\"white\",\"text\":\".\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, take damage from the sign and\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\" then collect some coins.\"}"\
]\
] 1

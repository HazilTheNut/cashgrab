# tutorial/sequence/stage_intro/pmt_give_transcript.mcfunction
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
"{\"italic\":false,\"color\":\"white\",\"text\":\"Welcome to the Cash Grab Arena tutorial!\"}",\
"[{\"italic\":false,\"color\":\"gray\",\"text\":\"If this was a misclick, use the \"},{\"color\":\"aqua\",\"text\":\"Return\"},{\"color\":\"gray\",\"text\":\" item on your hotbar.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, head to the next area.\"}",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"gray\",\"text\":\"You may need to \"},{\"color\":\"gold\",\"text\":\"set your Chat Settings\"}]",\
"[{\"italic\":false,\"color\":\"gold\",\"text\":\" > Unfocused Height to 75px\"},{\"color\":\"gray\",\"text\":\" or \"},{\"color\":\"gold\",\"text\":\"pick up a transcript\"}]",\
"[{\"italic\":false,\"color\":\"gray\",\"text\":\" from a nearby sign for the best experience.\"}]",\
]\
] 1

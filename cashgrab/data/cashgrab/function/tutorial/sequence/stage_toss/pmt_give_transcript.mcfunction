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
"[{\"italic\":false,\"color\":\"white\",\"text\":\"All Classes have a \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Toss Ability\"},{\"italic\":false,\"color\":\"white\",\"text\":\" that activates\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" when you \"},{\"italic\":false,\"color\":\"gold\",\"text\":\"drop any item\"},{\"italic\":false,\"color\":\"white\",\"text\":\".\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"During the tutorial, \"},{\"italic\":false,\"underlined\":true,\"color\":\"gold\",\"text\":\"you must drop your weapon to\"}]",\
"[{\"italic\":false,\"underlined\":true,\"color\":\"gold\",\"text\":\" activate this ability\"},{\"italic\":false,\"underlined\":false,\"color\":\"white\",\"text\":\".\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"Your \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Toss Ability\"},{\"italic\":false,\"color\":\"white\",\"text\":\" is adapted from the Spectre's \"}]",\
"[{\"italic\":false,\"color\":\"aqua\",\"text\":\" Blink\"},{\"italic\":false,\"color\":\"white\",\"text\":\", which is a short-range teleport.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, reach the end of the next area.\"}"\
]\
] 1

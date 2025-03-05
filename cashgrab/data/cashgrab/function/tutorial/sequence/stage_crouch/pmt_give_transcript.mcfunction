# tutorial/sequence/stage_crouch/pmt_give_transcript.mcfunction
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
"[{\"italic\":false,\"color\":\"white\",\"text\":\"Some Classes may have a \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Crouch Ability\"},{\"italic\":false,\"color\":\"white\",\"text\":\" that activates\"}]",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\" by \"},{\"italic\":false,\"color\":\"gold\",\"text\":\"crouching or sneaking\"},{\"italic\":false,\"color\":\"white\",\"text\":\". During the tutorial,\"}]",\
"[{\"italic\":false,\"underlined\":false,\"color\":\"white\",\"text\":\" \"},{\"italic\":false,\"underlined\":true,\"color\":\"gold\",\"text\":\"you must be holding your weapon to activate this ability\"},{\"italic\":false,\"underlined\":false,\"color\":\"white\",\"text\":\".\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"[{\"italic\":false,\"color\":\"white\",\"text\":\"Your \"},{\"italic\":false,\"color\":\"aqua\",\"text\":\"Crouch Ability\"},{\"italic\":false,\"color\":\"white\",\"text\":\" is adapted from the Ranger's \"}]",\
"[{\"italic\":false,\"color\":\"aqua\",\"text\":\" Wall Climb\"},{\"italic\":false,\"color\":\"white\",\"text\":\", which allows you to climb up walls.\"}]",\
"{\"italic\":false,\"color\":\"dark_gray\",\"text\":\"\"}",\
"{\"italic\":false,\"color\":\"yellow\",\"text\":\"To continue, reach the end of the next area.\"}"\
]\
] 1

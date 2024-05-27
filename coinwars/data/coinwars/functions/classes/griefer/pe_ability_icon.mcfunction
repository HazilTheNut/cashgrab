# classes/griefer/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 1
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:blaze_powder[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Crash Landing\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Rockets up into the air, causing\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" an explosion upon landing.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Jumping extends the height of ascent.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"10\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]\
] $(charges)

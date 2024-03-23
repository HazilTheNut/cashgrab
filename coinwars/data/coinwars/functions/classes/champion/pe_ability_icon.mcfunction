# classes/champion/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 6
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:yellow_dye{display:{\
Name:"[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Commander Charge\"}]",\
Lore:[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Grants you and nearby allies\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" a speed boost.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Afterwards, grants you and\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" nearby allies absorption.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"The absorption is stronger\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" when at low health.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"13\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]\
}} $(charges)
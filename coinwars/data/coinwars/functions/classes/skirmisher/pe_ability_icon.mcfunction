# classes/skirmisher/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 2
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:string[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Sword Boomerang\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Throws out your held sword\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" as a boomerang.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Catching the boomerang grants\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" bonus speed and refunds part\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" of the cooldown.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"The boomerang is lost if it hits\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" solid terrain.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"15\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]\
] $(charges)

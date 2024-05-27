# classes/frostknight/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 7
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:diamond[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Glacier\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Deploys a glacier construct\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that damages and slows around it.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"9\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"2\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charges\"}]"\
]] $(charges)

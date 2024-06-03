# classes/alchemist/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 9
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:redstone_torch[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Flame Trap\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Deploys a proximity trap that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" explodes and reveals enemies.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Traps persist for 2 minutes.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"20\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"2\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charges\"}]"\
]] $(charges)

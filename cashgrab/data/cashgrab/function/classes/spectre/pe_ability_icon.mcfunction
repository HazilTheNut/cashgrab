# classes/spectre/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 3
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:slime_ball[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Blink\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Teleports forwards.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"7\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"],\
] $(charges)

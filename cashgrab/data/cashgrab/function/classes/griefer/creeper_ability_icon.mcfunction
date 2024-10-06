# classes/griefer/creeper_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = 1
#
# Summary: Displays ability item for Creeper in a Bottle
#
# Arguments: (none)

item replace entity @s[scores={cv_C=1..}] hotbar.1 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"gray\",\"text\":\"Ability on Cooldown\"}"\
]

item replace entity @s[scores={cv_C=..0}] hotbar.1 with minecraft:experience_bottle[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Creeper in a Bottle\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Releases an ignited creeper.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"WARNING: You are not immune to\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" its explosive damage.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"8\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown\"}]"\
]\
]

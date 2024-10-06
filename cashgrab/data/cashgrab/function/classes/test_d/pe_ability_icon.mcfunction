# classes/test_d/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = -4
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments: (none)

item replace entity @s hotbar.4 with minecraft:clock[minecraft:item_name="{\"text\":\"Timer Test\"}"]

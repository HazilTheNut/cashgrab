# classes/test_c/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = -3
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments: (none)

item replace entity @s hotbar.4 with minecraft:ender_eye{display:{Name:"{\"text\":\"Raycast Test\"}"}}

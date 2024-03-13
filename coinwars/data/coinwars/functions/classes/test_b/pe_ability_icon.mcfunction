# classes/test_b/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = -2
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @s hotbar.4 with minecraft:fire_charge{display:{Name:"{\"text\":\"Missile Test\"}"}} $(charges)

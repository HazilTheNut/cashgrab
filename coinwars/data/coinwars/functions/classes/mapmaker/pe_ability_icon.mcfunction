# classes/mapmaker/pe_ability_icon.mcfunction
#
# Context:
#	as: an entity with class = -3
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments: (none)

item replace entity @s[scores={cv_A=0}] hotbar.4 with minecraft:ink_sac{display:{Name:"{\"text\":\"Toggle Tools\"}"}}
item replace entity @s[scores={cv_A=1}] hotbar.4 with minecraft:glow_ink_sac{display:{Name:"{\"text\":\"Toggle Tools\"}"}}

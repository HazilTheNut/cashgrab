# base/pe_display_ability_icon.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	cd_secs		: Cooldown remaining, in seconds

$execute if entity @s[scores={ability_cd_secs=1..}] run item replace entity @s hotbar.4 with minecraft:black_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"gray\",\"text\":\"Ability on Cooldown\"}"] $(cd_secs)

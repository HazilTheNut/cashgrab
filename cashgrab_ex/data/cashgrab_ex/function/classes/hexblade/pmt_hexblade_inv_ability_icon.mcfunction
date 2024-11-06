# classes/hexblade/pmt_hexblade_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:silence_armor_trim_smithing_template[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Hex\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a homing spell that\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" damages and \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Hexes\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" the target.\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Hexed\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" enemies are revealed\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and periodically take damage.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"13\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] $(charges)

# classes/alchemist/pmt_alchemist_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:redstone_torch[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Flame Trap\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Deploys a proximity trap that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" explodes and reveals enemies.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Traps persist for 2 minutes.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"35\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"3\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charges\"}]"\
]] $(charges)

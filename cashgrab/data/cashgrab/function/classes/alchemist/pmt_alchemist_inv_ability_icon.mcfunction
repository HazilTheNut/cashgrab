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

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

$item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=0}] hotbar.4 with minecraft:daylight_detector[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Translocator Pad\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Deploys a teleport pad.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Activating this ability again\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" teleports you to it after\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" a brief moment.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Taking damage prolongs the\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" teleportation.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"10\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] $(charges)

$item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1}] hotbar.4 with minecraft:clay_ball[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Translocator Pad\"}]",\
minecraft:item_model="minecraft:ender_eye",\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Teleports you to your Translocator\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" Pad after a brief moment.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Taking damage prolongs the\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" teleportation.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"10\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] $(charges)

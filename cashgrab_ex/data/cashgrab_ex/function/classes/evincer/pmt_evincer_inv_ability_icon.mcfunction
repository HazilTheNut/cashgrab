# classes/evincer/pmt_evincer_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

# Display if Mana is sufficient
$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:prismarine_crystals[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Prismatic Flash\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Teleports forwards and infuses\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" one charge of a random \"},{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" ability into your weapon:\"}",\
"[{\"color\":\"gold\",\"italic\":false,\"text\":\"Ochre Laser\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" fires a laser\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that damages and reveals a target.\"}",\
"[{\"color\":\"white\",\"italic\":false,\"text\":\"Pearlescent Wave\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" creates an\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" area damage wave.\"}",\
"[{\"color\":\"aqua\",\"italic\":false,\"text\":\"Cerulean Sphere\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" fires a homing\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" beam that damages and slows.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"7\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] $(charges)

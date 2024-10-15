# classes/chronomancer/pmt_chronomancer_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:cyan_stained_glass[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Stasis Field\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Projects a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field \"},{\"color\":\"gray\",\"italic\":false,\"text\":\"around you \"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that freezes all projectiles,\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" constructs, and traps within it.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This ability can be reactivated\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" to end the effect early.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"10\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charges\"}]"\
]] $(charges)

$execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 1 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:barrier[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Cancel Stasis Field\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Ends the \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field.\"}]",\
]] $(charges)
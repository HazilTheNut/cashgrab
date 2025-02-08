# classes/stargazer/pmt_stargazer_inv_ability_icon.mcfunction
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
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:nether_star[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Star Shower\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Toss any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Calls in a powerful shower\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" of stars in front of you.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Costs \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"25\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" Mana.\"}]"\
]] $(charges)

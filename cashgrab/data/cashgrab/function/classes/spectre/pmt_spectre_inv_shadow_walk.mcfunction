# classes/spectre/pmt_spectre_inv_shadow_walk.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Spectre class based on their current state
#
# Arguments:
#	count	: Item quantity to display

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown (in ms)
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:gunpowder[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Shadow Walk\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Crouch holding any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Turns you invisible while\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" energy remains.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This ability recharges itself\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" 5\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" seconds after use.\"}]"\
]\
] $(count)

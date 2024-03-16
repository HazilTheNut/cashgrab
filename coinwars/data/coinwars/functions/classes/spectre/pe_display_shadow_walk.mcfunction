# classes/spectre/pe_display_shadow_walk.mcfunction
#
# Context:
#	as: an entity with class = 3
#
# Summary: Populates inventory for the Spectre class based on their current state
#
# Arguments:
#	count	: Item quantity to display

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$item replace entity @s hotbar.5 with minecraft:gunpowder{display:{\
Name:"[{\"color\":\"green\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Shadow Walk\"}]",\
Lore:[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Turns you invisible while\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" energy remains.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This ability recharges itself\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" 5\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" seconds after use.\"}]"\
]\
}} $(count)

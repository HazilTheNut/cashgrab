# tutorial/trainee/pmt_trainee_inv_climbing_energy.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Ranger class based on their current state
#
# Arguments:
#	count	: Item quantity to display

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	If player is holding the weapon (==> cv_F = 1)
#	cv_G	:	
#	cv_H	:	

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:kelp[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Wall Climb\"}]",\
minecraft:lore=[\
"{\"color\":\"blue\",\"italic\":true,\"text\":\"Crouch holding your weapon to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While facing a wall, uses\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" energy to climb it.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Landing on the ground\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" recharges this ability.\"}",\
]] $(count)

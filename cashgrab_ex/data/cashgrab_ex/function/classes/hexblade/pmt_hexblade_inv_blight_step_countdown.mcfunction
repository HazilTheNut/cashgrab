# classes/hexblade/pmt_hexblade_inv_blight_step_countdown.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Hexblade class onto the command executor
#
# Arguments: 
#	count	:	Quantity of item displayed

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:

#$tellraw @a[tag=t_debug] "classes/hexblade/pmt_hexblade_inv_blight_step_countdown: count = $(count)"

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:glow_ink_sac[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Blight Step\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Crouch holding any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"After holding for 1 second,\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" you consume your \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Hex\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" to \"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" heal a small amount and\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" teleport behind the target.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"You may also teleport to\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" Hexed\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" players shortly\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" after they die.\"}",\
]] $(count)


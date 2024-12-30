# classes/hexblade/pmt_hexblade_inv_blight_step.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays Blight Step icon
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=1..}] store result storage cashgrab_ex:hexblade_blight_step_args count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_D
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=1..}] run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step_countdown with storage cashgrab_ex:hexblade_blight_step_args
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=1..}] run return 0

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0}] hotbar.5 with minecraft:ink_sac[\
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
]] 1

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] hotbar.5 with minecraft:glow_ink_sac[\
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
]] 1

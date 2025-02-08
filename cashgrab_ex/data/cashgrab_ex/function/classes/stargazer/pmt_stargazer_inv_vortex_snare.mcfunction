# classes/stargazer/pmt_stargazer_inv_vortex_snare.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays Vortex Snare
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset


# Display if Mana is sufficient and lockout timer is ended
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=10..,cv_C=..0}] hotbar.2 with minecraft:spire_armor_trim_smithing_template[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Vortex Snare\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a miniature black hole\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that pulls in and traps\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" one enemy.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Costs \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"10\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" Mana\"}]"\
]] 1

# Display "Out of Mana" if insufficent and lockout timer is ended
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..9,cv_C=..0}] hotbar.2 with minecraft:red_stained_glass_pane[\
minecraft:item_name="[{\"color\":\"red\",\"italic\":false,\"text\":\"Out of Mana\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

# Display "Lockout" if lockout timer is ongoing
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1..}] hotbar.2 with minecraft:ghast_tear[\
minecraft:item_name="[{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"---\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

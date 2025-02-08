# classes/stargazer/pmt_stargazer_inv_astral_dart.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays Astral Dart
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
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_C=..0}] hotbar.0 with minecraft:vex_armor_trim_smithing_template[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Astral Dart\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:entity.ender_eye.death",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a bolt of starlight.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Costs \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" Mana\"}]"\
]] 1

# Display "Out of Mana" if insufficent and lockout timer is ended
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..0,cv_C=..0}] hotbar.0 with minecraft:red_stained_glass_pane[\
minecraft:item_name="[{\"color\":\"red\",\"italic\":false,\"text\":\"Out of Mana\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

# Display "Lockout" if lockout timer is ongoing
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1..}] hotbar.0 with minecraft:ghast_tear[\
minecraft:item_name="[{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"---\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

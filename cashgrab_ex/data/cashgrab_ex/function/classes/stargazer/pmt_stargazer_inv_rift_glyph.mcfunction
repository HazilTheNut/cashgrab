# classes/stargazer/pmt_stargazer_inv_rift_glyph.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays Rift Glyph
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset


# Display if Mana is sufficient and lockout timer is ended
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=6..,cv_C=..0}] hotbar.1 with minecraft:wayfinder_armor_trim_smithing_template[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Rift Glyph\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:entity.ender_eye.death",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Teleports forward a short distance\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" and leaves behind a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Rift Glyph\"},{\"color\":\"gray\",\"italic\":false,\"text\":\".\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Using this ability additional times\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" teleports you to your previous\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" Rift Glyph\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" instead.\"}]",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"Costs \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"6\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" Mana\"}]"\
]] 1

# Display "Out of Mana" if insufficent and lockout timer is ended
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..5,cv_C=..0}] hotbar.1 with minecraft:red_stained_glass_pane[\
minecraft:item_name="[{\"color\":\"red\",\"italic\":false,\"text\":\"Out of Mana\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

# Display "Lockout" if lockout timer is ongoing
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1..}] hotbar.1 with minecraft:ghast_tear[\
minecraft:item_name="[{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"---\"}]",\
minecraft:hide_additional_tooltip={},\
] 1

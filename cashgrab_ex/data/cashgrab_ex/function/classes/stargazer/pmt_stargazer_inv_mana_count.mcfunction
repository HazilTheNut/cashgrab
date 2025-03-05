# classes/stargazer/pmt_stargazer_inv_mana_count.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Scrap counter into inventory based on count
#
# Arguments: 
#   count   :   Number of Scrap collected

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer	
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:blue_dye[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Mana\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"You generate \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"1 \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Mana\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" every second.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"---\"}",\
"[{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"You have \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"$(count)\"},{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"/25 Mana.\"}]",\
]] $(count)

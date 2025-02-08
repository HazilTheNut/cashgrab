# classes/battlesmith/pmt_battlesmith_inv_scrap.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Scrap counter into inventory based on count
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

# Display "0" count if at 0
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:iron_nugget[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Scrap (0/20)\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Dealing damage and collecting\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" coins generates \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Scrap\"},{\"color\":\"gray\",\"italic\":false,\"text\":\".\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Scrap\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" can be spent using your\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" Upgrade Weapon\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" ability.\"}]",\
]] 1

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

# Display current scrap count if >= 1
execute store result storage cashgrab_ex:battlesmith_args count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_A
function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_scrap_count with storage cashgrab_ex:battlesmith_args

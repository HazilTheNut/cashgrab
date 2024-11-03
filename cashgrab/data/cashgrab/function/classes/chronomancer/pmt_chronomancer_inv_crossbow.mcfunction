# classes/chronomancer/pmt_chronomancer_inv_crossbow.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Updates the crossbow item based on the class's current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	state value if player is in a Stasis Field
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

clear @a[tag=t_pm_owner,limit=1] minecraft:crossbow

# Crossbow is not in stasis, loaded, and in hotbar
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1,cv_A=0,cv_D=..0}] run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b}]]

# Crossbow is not in stasis, loaded, and in offhand
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1,cv_A=1,cv_D=..0}] run item replace entity @a[tag=t_pm_owner,limit=1] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b}]]

# Crossbow is not in stasis, unloaded, and in hotbar
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=0,cv_A=0,cv_D=..0}] run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[]]

# Crossbow is not in stasis, unloaded, and in offhand
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=0,cv_A=1,cv_D=..0}] run item replace entity @a[tag=t_pm_owner,limit=1] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[]]

# Crossbow is in stasis, loaded, and in hotbar
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1,cv_A=0,cv_D=1..}] run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b}]]

# Crossbow is in stasis, loaded, and in offhand
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=1,cv_A=1,cv_D=1..}] run item replace entity @a[tag=t_pm_owner,limit=1] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b}]]

# Crossbow is in stasis, unloaded, and in hotbar
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=0,cv_A=0,cv_D=1..}] run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[]]

# Crossbow is in stasis, unloaded, and in offhand
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=0,cv_A=1,cv_D=1..}] run item replace entity @a[tag=t_pm_owner,limit=1] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Clockwork Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are near and aiming\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" into a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[]]


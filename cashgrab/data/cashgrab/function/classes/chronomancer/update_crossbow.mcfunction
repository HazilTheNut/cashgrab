# classes/chronomancer/update_crossbow.mcfunction
#
# Context:
#	as: an entity with class = 10
#	at: the entity
#
# Summary: Updates the crossbow item based on the class's current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

clear @s minecraft:crossbow

# Crossbow is not in stasis, loaded, and in hotbar
execute if entity @s[tag=!t_stasis,scores={cv_C=1,cv_A=0}] run item replace entity @s hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b}]]

# Crossbow is not in stasis, loaded, and in offhand
execute if entity @s[tag=!t_stasis,scores={cv_C=1,cv_A=1}] run item replace entity @s weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b}]]

# Crossbow is not in stasis, unloaded, and in hotbar
execute if entity @s[tag=!t_stasis,scores={cv_C=0,cv_A=0}] run item replace entity @s hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[]]

# Crossbow is not in stasis, unloaded, and in offhand
execute if entity @s[tag=!t_stasis,scores={cv_C=0,cv_A=1}] run item replace entity @s weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:charged_projectiles=[]]

# Crossbow is in stasis, loaded, and in hotbar
execute if entity @s[tag=t_stasis,scores={cv_C=1,cv_A=0}] run item replace entity @s hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b}]]

# Crossbow is in stasis, loaded, and in offhand
execute if entity @s[tag=t_stasis,scores={cv_C=1,cv_A=1}] run item replace entity @s weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b},{id:"minecraft:arrow",count:1b}]]

# Crossbow is in stasis, unloaded, and in hotbar
execute if entity @s[tag=t_stasis,scores={cv_C=0,cv_A=0}] run item replace entity @s hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[]]

# Crossbow is in stasis, unloaded, and in offhand
execute if entity @s[tag=t_stasis,scores={cv_C=0,cv_A=1}] run item replace entity @s weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Automechanical Crossbow\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This crossbow automatically\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" reloads itself.\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\"While you are in a \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"Stasis Field\"},{\"color\":\"gray\",\"italic\":false,\"text\":\":\"}]",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it reloads faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ it fires more arrows\"}"\
],\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={levels:{multishot:1},show_in_tooltip:false},\
minecraft:charged_projectiles=[]]


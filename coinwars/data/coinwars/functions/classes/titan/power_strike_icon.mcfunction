# classes/titan/power_strike_icon.mcfunction
#
# Context:
#	as: an entity with class = 8
#
# Summary: Inserts Power Strike icon
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

item replace entity @s[scores={cv_A=1..}] hotbar.1 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"gray\",\"text\":\"Ability on Cooldown\"}"\
]

item replace entity @s[scores={cv_A=..0}] hotbar.1 with minecraft:golden_axe[\
minecraft:damage=31,\
minecraft:enchantments={levels:{knockback:5},show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",uuid:[I; 8,2,1,0],name:"power_strike_atkdmg",amount:8,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",uuid:[I; 8,2,2,0],name:"power_strike_atkspd",amount:-1,operation:"add_value"}],\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Attack]\"},{\"color\":\"white\",\"text\":\" Power Strike\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Strong knockback attack\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that deals slows them if\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" you hit them into a wall.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"7\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] 1

# classes/titan/pmt_titan_inv_power_strike.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Power Strike icon
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_B=..0}] hotbar.1 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="{\"italic\":false,\"color\":\"gray\",\"text\":\"Ability on Cooldown\"}"\
]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_B=1..}] hotbar.1 with minecraft:golden_axe[\
minecraft:damage=31,\
minecraft:enchantments={levels:{knockback:5},show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"cashgrab:power_strike_atkdmg",amount:8,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"cashgrab:power_strike_atkspd",amount:-1,operation:"add_value"}],\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Attack]\"},{\"color\":\"white\",\"text\":\" Power Strike\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Strong knockback attack\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" that slows them if you\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" hit them into a wall.\"}",\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"=====\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"7\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" sec cooldown for \"},{\"color\":\"yellow\",\"italic\":false,\"text\":\"1\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" charge\"}]"\
]] 1

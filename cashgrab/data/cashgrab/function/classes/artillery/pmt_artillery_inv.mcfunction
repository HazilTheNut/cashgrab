# classes/artillery/pmt_artillery_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Artillery class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=11842740]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:chainmail_chestplate[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:chainmail_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=11842740,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Infinibow
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:bow[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Infinibow\"}",\
minecraft:enchantments={levels:{infinity:1}}]

item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:arrow

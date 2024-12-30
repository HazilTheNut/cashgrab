# classes/frostknight/pmt_frostknight_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Frost Knight class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:iron_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=8314871]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:iron_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:iron_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Glacial Shard
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:iron_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Glacial Shard\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:glacialshard_atkdmg",amount:5.5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:glacialshard_atkspd",amount:-2,operation:"add_value"}]]

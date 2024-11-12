# classes/alchemist/pe_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Alchemist class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=9516260,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Magicite Shiv
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:amethyst_shard[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:enchantment_glint_override=true,\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Magicite Shiv\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:magiciteshiv_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:magiciteshiv_atkspd",amount:-2,operation:"add_value"}]]

# Potions
function cashgrab:classes/alchemist/pmt_alchemist_inv_potions

# Potion brewing icon
function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
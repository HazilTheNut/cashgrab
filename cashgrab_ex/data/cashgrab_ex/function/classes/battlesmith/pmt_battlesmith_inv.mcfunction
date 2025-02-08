# classes/battlesmith/pmt_battlesmith_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Battlesmith class for the command executor
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

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"armor",slot:"head",id:"cashgrab:helmet_armor",amount:3,operation:"add_value"}\
]]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:netherite_chestplate[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"armor",slot:"chest",id:"cashgrab:chest_armor",amount:3,operation:"add_value"}\
],\
minecraft:trim={\
pattern:"spire",\
material:"resin",\
show_in_tooltip:false\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:netherite_leggings[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"armor",slot:"legs",id:"cashgrab:legs_armor",amount:3,operation:"add_value"}\
],\
minecraft:trim={\
pattern:"snout",\
material:"resin",\
show_in_tooltip:false\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:iron_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=5048136,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:5,operation:"add_value"}\
]]

# =============================
# Hotbar

# Forgeblade (I-IV)
function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_sword

# Scrap Counter
function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_scrap

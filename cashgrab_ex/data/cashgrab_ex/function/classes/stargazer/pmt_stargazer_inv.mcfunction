# classes/stargazer/pmt_stargazer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Stargazer class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=722747,\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=1182805,\
minecraft:trim={\
pattern:"raiser",\
material:"gold",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=2234505,\
minecraft:trim={\
pattern:"spire",\
material:"gold",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=3286700,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Spells
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_spells

# Mana
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana

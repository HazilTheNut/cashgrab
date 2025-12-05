# classes/dancer/pmt_dancer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Dancer class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer
#	cv_D	:	Sound Effect timer (base)
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	Sound Effect timer (refresh buff)
#	cv_G	:	Refresh Buff Timer Cooldown / Sforzando missile pitch deflection (mdeg)
#	cv_H	:   Sforzando missile yaw deflection (mdeg)

# === Armor
# Helmet, Chestplate, Leggings always the same
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
dyed_color=15961002,\
]

item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
dyed_color=15961002,\
minecraft:trim={pattern:vex,material:gold}\
]

item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:golden_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
]

#Boots have variable speed depending on current Tempo state.
function cg_maks:classes/dancer/pmt_dancer_inv_armor

# === Hotbar
# Lucky Cane
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:wooden_hoe[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Lucky Cane"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:luckycane_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:luckycane_atkspd",amount:-2,operation:"add_value"}]]

# Tempo Icon
function cg_maks:classes/dancer/pmt_dancer_inv_tempo
# classes/hexblade/pmt_hexblade_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Hexblade class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:iron_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=5048136,\
minecraft:trim={\
pattern:"host",\
material:"diamond",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=5048136,\
minecraft:trim={\
pattern:"host",\
material:"diamond",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=5048136,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:5,operation:"add_value"}\
]]

# =============================
# Hotbar

# Absolute Edge
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:netherite_sword[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Absolute Edge"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:absoluteedge_atkdmg",amount:6.5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:absoluteedge_atkspd",amount:-2,operation:"add_value"}]]

# Blight Step icon
function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# classes/griefer/pmt_griefer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Griefer class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown (in ms)
#	cv_D	:	Creeper in a Bottle charge
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:golden_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=16490297]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=16490297,\
minecraft:trim={\
pattern:"tide",\
material:"resin",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:golden_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim"]},\
minecraft:trim={\
pattern:"spire",\
material:"resin",\
},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:6,operation:"add_value"}\
]]

# =============================
# Hotbar

# Flame Staff
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:blaze_rod[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Flame Staff"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:flame_staff_atkdmg",amount:4,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:flame_staff_atkspd",amount:-1.5,operation:"add_value"}],\
minecraft:enchantments={fire_aspect:1}]

# Creeper in a Bottle
function cashgrab:classes/griefer/pmt_inv_creeper_ability_icon

# classes/chronomancer/pmt_chronomancer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Chronomancer class for the command executor
#
# Arguments: (none)

#	cv_A	:	
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	state value if player is in a Stasis Field
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:diamond_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=10840833,\
minecraft:trim={\
pattern:"shaper",\
material:"resin",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=10840833]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=10840833,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:5,operation:"add_value"}\
]]

# =============================
# Hotbar

# Time-Worn Splinter
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Time-Worn Splinter"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:timeworn_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:timeworn_atkspd",amount:-2,operation:"add_value"}]]

# Clockwork Crossbow
function cashgrab:classes/chronomancer/pmt_chronomancer_inv_crossbow

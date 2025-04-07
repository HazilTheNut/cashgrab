# classes/battlesmith/pmt_battlesmith_inv_sword.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts sword into inventory based on progression level
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

# Tier I (cv_E = 0)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=0}] hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name={italic:false,color:"red",text:"Forgeblade I"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Tier II (cv_E = 1)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1}] hotbar.0 with minecraft:iron_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name={italic:false,color:"red",text:"Forgeblade II"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Tier III (cv_E = 2)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=2}] hotbar.0 with minecraft:diamond_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name={italic:false,color:"red",text:"Forgeblade III"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:7,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Tier IV (cv_E = 3)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=3}] hotbar.0 with minecraft:diamond_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name={italic:false,color:"red",text:"Forgeblade IV"},\
minecraft:enchantment_glint_override=true,\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:8,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]



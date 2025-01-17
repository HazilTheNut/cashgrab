# classes/champion/pmt_champion_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Champion class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:golden_helmet[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:golden_chestplate[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:golden_leggings[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:golden_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Duskpiercer
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:golden_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Duskpiercer\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:duskpiercer_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:duskpiercer_atkspd",amount:-2,operation:"add_value"}]]

# Bastion (offhand if trinket is not in slot)
item replace entity @a[tag=t_pm_owner,limit=1,scores={trinket_in_offhand=0}] weapon.offhand with minecraft:shield[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Bastion\"}"]

# Bastion (hotbar if trinket is in offhand)
item replace entity @a[tag=t_pm_owner,limit=1,scores={trinket_in_offhand=1..}] hotbar.1 with minecraft:shield[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Bastion\"}"]

# classes/titan/pmt_titan_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Titan class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:iron_helmet[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:iron_chestplate[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:trim={\
pattern:"shaper",\
material:"amethyst",\
show_in_tooltip:false\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:iron_leggings[minecraft:unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:iron_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.15,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Giant Hammer
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:iron_axe[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Giant Hammer\"}",\
minecraft:enchantments={levels:{knockback:1},show_in_tooltip:true},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:giant_hammer_atkdmg",amount:8,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:giant_hammer_atkspd",amount:-3,operation:"add_value"}]]

# Power Strike
function cashgrab:classes/titan/pmt_titan_inv_power_strike

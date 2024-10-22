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
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:iron_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9699666]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9699666]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=9699666,\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"cashgrab:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Absolute Edge
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:netherite_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Absolute Edge\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"cashgrab:absoluteedge_atkdmg",amount:6,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"cashgrab:absoluteedge_atkspd",amount:-2,operation:"add_value"}]]

# Blight Step icon
function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# classes/skirmisher/pmt_skirmisher_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Skirmisher class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	If 1, refresh inventory
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=15653548]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=15653548]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=15653548]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=15653548,minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"cashgrab:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar (when you have both swords)
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 0 if score @a[tag=t_pm_owner,limit=1] cv_A matches 0..1 run function cashgrab:classes/skirmisher/pmt_skirmisher_inv_swords {\
b_cleaving_scimitar_enable:1,s_cleaving_scimitar_slot:"hotbar.0",b_dancing_rapier_enable:1,s_dancing_rapier_slot:"weapon.offhand"}
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 0 if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run function cashgrab:classes/skirmisher/pmt_skirmisher_inv_swords {\
b_cleaving_scimitar_enable:1,s_cleaving_scimitar_slot:"weapon.offhand",b_dancing_rapier_enable:1,s_dancing_rapier_slot:"hotbar.0"}

# =============================
# Hotbar (when you have only one sword)
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1 run function cashgrab:classes/skirmisher/pmt_skirmisher_inv_swords {\
b_cleaving_scimitar_enable:1,s_cleaving_scimitar_slot:"hotbar.0",b_dancing_rapier_enable:0,s_dancing_rapier_slot:"hotbar.0"}
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 2 run function cashgrab:classes/skirmisher/pmt_skirmisher_inv_swords {\
b_cleaving_scimitar_enable:0,s_cleaving_scimitar_slot:"hotbar.0",b_dancing_rapier_enable:1,s_dancing_rapier_slot:"hotbar.0"}

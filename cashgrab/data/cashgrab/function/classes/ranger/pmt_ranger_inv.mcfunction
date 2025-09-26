# classes/ranger/pmt_ranger_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Ranger class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = unloaded, 1 = loaded)
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=2665010]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
minecraft:dyed_color=2665010]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=2665010,\
minecraft:trim={\
pattern:"rib",\
material:"copper",\
}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:trim","minecraft:dyed_color"]},\
minecraft:dyed_color=7820589,\
minecraft:trim={\
pattern:"wild",\
material:"netherite",\
},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:6,operation:"add_value"}\
]]

# =============================
# Hotbar

# Machete
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Machete"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:machete_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:machete_atkspd",amount:-2,operation:"add_value"}]]

# Crossbow
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_F=0,trinket_in_offhand=0}] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Hunting Bow"},\
minecraft:enchantment_glint_override=false,\
minecraft:enchantments={quick_charge:1}]
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_F=1,trinket_in_offhand=0}] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Hunting Bow"},\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}],\
minecraft:enchantment_glint_override=false,\
minecraft:enchantments={quick_charge:1}]
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_F=0,trinket_in_offhand=1}] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Hunting Bow"},\
minecraft:enchantment_glint_override=false,\
minecraft:enchantments={quick_charge:1}]
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_F=1,trinket_in_offhand=1}] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Hunting Bow"},\
minecraft:enchantment_glint_override=false,\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}],\
minecraft:enchantments={quick_charge:1}]

# Arrows
clear @a[tag=t_pm_owner,limit=1] minecraft:arrow
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1}] hotbar.6 with minecraft:arrow 1
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=2}] hotbar.6 with minecraft:arrow 2
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=3}] hotbar.6 with minecraft:arrow 3

# Climbing Energy
execute store result storage cashgrab:ranger_args data.count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B
function cashgrab:classes/ranger/pmt_ranger_inv_climbing_energy with storage cashgrab:ranger_args data

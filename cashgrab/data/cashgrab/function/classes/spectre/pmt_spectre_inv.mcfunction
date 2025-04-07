# classes/spectre/pmt_spectre_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Spectre class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown (in ms)
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..0}] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=7727312,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"head",id:"cashgrab:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"armor",slot:"head",id:"cashgrab:helmet_armor",amount:5,operation:"add_value"}],\
minecraft:enchantment_glint_override=true]
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..0}] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=7727312,\
minecraft:enchantment_glint_override=true]
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] armor.head with minecraft:air
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] armor.chest with minecraft:air
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:air
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:air

# =============================
# Hotbar

# Spectral Blade
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..0}] hotbar.0 with minecraft:diamond_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name={italic:false,color:"red",text:"Spectral Blade"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:spectral_blade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:spectral_blade_atkspd",amount:-2,operation:"add_value"}],\
minecraft:enchantment_glint_override=true]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] hotbar.0 with minecraft:air

# Shadow Walk
execute store result storage cashgrab:spectre_args data.count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B
function cashgrab:classes/spectre/pmt_spectre_inv_shadow_walk with storage cashgrab:spectre_args data

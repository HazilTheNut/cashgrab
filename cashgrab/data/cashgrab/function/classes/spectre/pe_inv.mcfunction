# classes/spectre/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 3
#
# Summary: Populates inventory for the Spectre class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s[scores={cv_A=..0}] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=7727312,\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"head",id:"coinwars:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"head",id:"coinwars:helmet_armor",amount:1,operation:"add_value"}],\
minecraft:enchantment_glint_override=true]
item replace entity @s[scores={cv_A=..0}] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=7727312,\
minecraft:enchantment_glint_override=true]
item replace entity @s[scores={cv_A=1..}] armor.head with minecraft:air
item replace entity @s[scores={cv_A=1..}] armor.chest with minecraft:air
item replace entity @s armor.legs with minecraft:air
item replace entity @s armor.feet with minecraft:air

# =============================
# Hotbar

# Spectral Blade
item replace entity @s[scores={cv_A=..0}] hotbar.0 with minecraft:diamond_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Spectral Blade\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:spectral_blade_atkdmg",amount:7,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:spectral_blade_atkspd",amount:-2,operation:"add_value"}],\
minecraft:enchantment_glint_override=true]

item replace entity @s[scores={cv_A=1..}] hotbar.0 with minecraft:air

# Shadow Walk
execute store result storage coinwwars:spectre_args data.count int 1 run scoreboard players get @s cv_B
function coinwars:classes/spectre/pe_display_shadow_walk with storage coinwwars:spectre_args data

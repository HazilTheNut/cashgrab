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
item replace entity @s[scores={cv_A=..0}] armor.head with minecraft:leather_helmet{Unbreakable:1b,display:{color:7727312},AttributeModifiers:[\
{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"head",Operation:1,Amount:0.3,UUID:[I; 1,14,1,0]},\
{AttributeName:"generic.armor",Name:"head_armor",Slot:"head",Operation:0,Amount:1,UUID:[I; 1,14,2,0]}],\
Enchantments:[{id:"minecraft:feather_falling",lvl:1}],HideFlags:1}
item replace entity @s[scores={cv_A=..0}] armor.chest with minecraft:leather_chestplate{Unbreakable:1b,display:{color:7727312},\
Enchantments:[{id:"minecraft:feather_falling",lvl:1}],HideFlags:1}
item replace entity @s[scores={cv_A=1..}] armor.head with minecraft:air
item replace entity @s[scores={cv_A=1..}] armor.chest with minecraft:air
item replace entity @s armor.legs with minecraft:air
item replace entity @s armor.feet with minecraft:air

# =============================
# Hotbar

# Spectral Blade
item replace entity @s[scores={cv_A=..0}] hotbar.0 with minecraft:diamond_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Spectral Blade\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"spectral_blade_atkdmg",Slot:"mainhand",Operation:0,Amount:7,UUID:[I; 3,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"spectral_blade_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 3,1,2,0]}],\
Enchantments:[{id:"minecraft:feather_falling",lvl:1}],HideFlags:1}
item replace entity @s[scores={cv_A=1..}] hotbar.0 with minecraft:air

# Shadow Walk
execute store result storage coinwwars:spectre_args data.count int 1 run scoreboard players get @s cv_B
function coinwars:classes/spectre/pe_display_shadow_walk with storage coinwwars:spectre_args data

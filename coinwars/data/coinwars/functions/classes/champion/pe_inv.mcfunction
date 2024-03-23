# classes/champion/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 6
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
item replace entity @s armor.head with minecraft:golden_helmet{Unbreakable:1b}
item replace entity @s armor.chest with minecraft:golden_chestplate{Unbreakable:1b}
item replace entity @s armor.legs with minecraft:golden_leggings{Unbreakable:1b}
item replace entity @s armor.feet with minecraft:golden_boots{Unbreakable:1b,AttributeModifiers:[\
{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"feet",Operation:1,Amount:0.2,UUID:[I; 4,14,1,0]},\
{AttributeName:"generic.armor",Name:"boots_armor",Slot:"feet",Operation:0,Amount:1,UUID:[I; 4,14,2,0]}]}

# =============================
# Hotbar

# Duskpiercer
item replace entity @s hotbar.0 with minecraft:golden_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Duskpiercer\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"machete_atkdmg",Slot:"mainhand",Operation:0,Amount:4,UUID:[I; 6,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"machete_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 6,1,2,0]}]}

# Bastion
item replace entity @s weapon.offhand with minecraft:shield{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Bastion\"}"}}

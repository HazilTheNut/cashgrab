# classes/skirmisher/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 2
#
# Summary: Populates inventory for the Skirmisher class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if holding the Dancing Rapier, and 0 otherwise. 
#				Used to track which weapon is equipped to not reset their current positions when inventory refreshes.
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# =============================
# Armor
item replace entity @s armor.head with minecraft:leather_helmet{Unbreakable:1b,display:{color:15653548}}
item replace entity @s armor.chest with minecraft:leather_chestplate{Unbreakable:1b,display:{color:15653548}}
item replace entity @s armor.legs with minecraft:leather_leggings{Unbreakable:1b,display:{color:15653548}}
item replace entity @s armor.feet with minecraft:leather_boots{Unbreakable:1b,display:{color:15653548},AttributeModifiers:[\
{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"feet",Operation:1,Amount:0.2,UUID:[I; 1,14,1,0]},\
{AttributeName:"generic.armor",Name:"boots_armor",Slot:"feet",Operation:0,Amount:1,UUID:[I; 1,14,2,0]}]}

# =============================
# Hotbar

# Cleaving Cutlass (mainhand)
item replace entity @s[scores={cv_A=0}] hotbar.0 with minecraft:iron_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Cleaving Cutlass\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"cleaving_cutlass_atkdmg",Slot:"mainhand",Operation:0,Amount:6,UUID:[I; 2,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"cleaving_cutlass_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 2,1,2,0]}]}

# Dancing Rapier (offhand)
item replace entity @s[scores={cv_A=0}] weapon.offhand with minecraft:golden_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Dancing Rapier\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"dancing_rapier_atkdmg",Slot:"mainhand",Operation:0,Amount:4,UUID:[I; 2,2,1,0]},\
{AttributeName:"generic.attack_speed",Name:"dancing_rapier_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 2,2,2,0]},\
{AttributeName:"generic.movement_speed",Name:"dancing_rapier_atkspd",Slot:"mainhand",Operation:1,Amount:0.15,UUID:[I; 2,2,3,0]}],\
Enchantments:[{id:"minecraft:knockback",lvl:1}]}

# Cleaving Cutlass (offhand)
item replace entity @s[scores={cv_A=1..}] weapon.offhand with minecraft:iron_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Cleaving Cutlass\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"cleaving_cutlass_atkdmg",Slot:"mainhand",Operation:0,Amount:6,UUID:[I; 2,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"cleaving_cutlass_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 2,1,2,0]}]}

# Dancing Rapier (mainhand)
item replace entity @s[scores={cv_A=1..}] hotbar.0 with minecraft:golden_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Dancing Rapier\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"dancing_rapier_atkdmg",Slot:"mainhand",Operation:0,Amount:4,UUID:[I; 2,2,1,0]},\
{AttributeName:"generic.attack_speed",Name:"dancing_rapier_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 2,2,2,0]},\
{AttributeName:"generic.movement_speed",Name:"dancing_rapier_atkspd",Slot:"mainhand",Operation:1,Amount:0.15,UUID:[I; 2,2,3,0]}],\
Enchantments:[{id:"minecraft:knockback",lvl:1}]}
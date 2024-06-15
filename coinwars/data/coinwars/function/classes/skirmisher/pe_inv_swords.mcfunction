# classes/skirmisher/pe_inv_swords.mcfunction
#
# Context:
#	as: an entity with class = 2
#
# Summary: Inserts swords (Cleaving Scimitar and Dancing Rapier) into inventory based on class variable state
#
# Arguments:
#	b_cleaving_scimitar_enable	:	Whether to insert the Cleaving Scimitar
#	s_cleaving_scimitar_slot	:	Slot to insert Cleaving Scimitar
#	b_dancing_rapier_enable		:	Whether to insert the Dancing Rapier
#	s_dancing_rapier_slot		:	Slot to insert Dancing Rapier

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# Cleaving Cutlass
$scoreboard players set @s temp_A $(b_cleaving_scimitar_enable)

$item replace entity @s[scores={temp_A=1..}] $(s_cleaving_scimitar_slot) with minecraft:iron_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Cleaving Cutlass\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"When used with Sword Boomerang:\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ Deals increased damage\"}"],\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:cleaving_cutlass_atkdmg",amount:6,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:cleaving_cutlass_atkspd",amount:-2,operation:"add_value"}\
]\
]

# Dancing Rapier
$scoreboard players set @s temp_A $(b_dancing_rapier_enable)

$item replace entity @s[scores={temp_A=1..}] $(s_dancing_rapier_slot) with minecraft:golden_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Dancing Rapier\"}",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":false,\"text\":\"---\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"When used with Sword Boomerang:\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ Travels farther and faster\"}",\
"{\"color\":\"gold\",\"italic\":false,\"text\":\"+ Returns sooner\"}"],\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:dancing_rapier_atkdmg",amount:4,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:dancing_rapier_atkspd",amount:-2,operation:"add_value"},\
{type:"generic.movement_speed",slot:"mainhand",id:"coinwars:dancing_rapier_atkspd",amount:0.15,operation:"add_multiplied_base"}\
],\
minecraft:enchantments={levels:{"minecraft:knockback":1},show_in_tooltip:true}\
]

# classes/evincer/pmt_evincer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Evincer class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=15783405,\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=15783405,\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=15783405,\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=15783405,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Chaos Shaper (cv_A = 0)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=0}] hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Chaos Shaper\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Ochre Laser (cv_A = 1)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Ochre Laser\"}]",\
minecraft:item_model="minecraft:golden_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Pearlescent Wave (cv_A = 2)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=2}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Pearlescent Wave\"}]",\
minecraft:item_model="minecraft:iron_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]

# Cerulean Sphere (cv_A = 3)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=3}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Cerulean Sphere\"}]",\
minecraft:item_model="minecraft:diamond_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:forgeblade_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:forgeblade_atkspd",amount:-2,operation:"add_value"}]]


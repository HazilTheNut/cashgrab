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
minecraft:dyed_color=12420975,\
minecraft:trim={\
pattern:"bolt",\
material:"resin",\
show_in_tooltip:false\
},\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=12420975,\
minecraft:trim={\
pattern:"flow",\
material:"amethyst",\
show_in_tooltip:false\
},\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=10182726,\
minecraft:trim={\
pattern:"bolt",\
material:"diamond",\
show_in_tooltip:false\
},\
]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=10182726,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Hotbar

# Chaos Shaper (cv_A = 0)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0}] hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Chaos Shaper\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:chaosshaper_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:chaosshaper_atkspd",amount:-2,operation:"add_value"}]]

# Ochre Laser (cv_A = 1)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Ochre Laser\"}]",\
minecraft:item_model="minecraft:golden_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.amethyst_block.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a laser that damages\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and reveals a target.\"}",\
],\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:chaosshaper_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:chaosshaper_atkspd",amount:-2,operation:"add_value"}]]

# Pearlescent Wave (cv_A = 2)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=2}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Pearlescent Wave\"}]",\
minecraft:item_model="minecraft:iron_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.amethyst_block.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Creates an area\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" damage wave.\"}",\
],\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:chaosshaper_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:chaosshaper_atkspd",amount:-2,operation:"add_value"}]]

# Cerulean Sphere (cv_A = 3)
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=3}] hotbar.0 with minecraft:stick[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="[{\"italic\":false,\"color\":\"green\",\"text\":\"[Use]\"},{\"italic\":false,\"color\":\"red\",\"text\":\" Cerulean Sphere\"}]",\
minecraft:item_model="minecraft:diamond_sword",\
minecraft:enchantment_glint_override=true,\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.amethyst_block.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a homing beam that \"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" damages and slows.\"}",\
],\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:chaosshaper_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:chaosshaper_atkspd",amount:-2,operation:"add_value"}]]


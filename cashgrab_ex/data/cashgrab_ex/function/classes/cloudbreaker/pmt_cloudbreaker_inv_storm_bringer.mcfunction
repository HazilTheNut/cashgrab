# classes/cloudbreaker/pmt_cloudbreaker_inv_storm_bringer.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts icon for Thunder Seed
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Nimbus Stride duration remaining, in ticks
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Thunder Seed charge
#	cv_F	:	Thunder Seed cooldown, in ms
#	cv_G	:	
#	cv_H	:	

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=..0}] hotbar.0 with minecraft:torchflower_seeds[\
minecraft:item_model="minecraft:stone_axe",\
minecraft:weapon={disable_blocking_for_seconds:5},\
minecraft:custom_name={italic:false,color:"red",text:"Storm Bringer"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:storm_bringer_atkdmg",amount:7,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:storm_bringer_atkspd",amount:-2.5,operation:"add_value"}],\
minecraft:lore=[\
{color:"gray",italic:false,text:"Throws a seed that creates"},\
{color:"gray",italic:false,text:" a lightning bolt. "},\
[{color:"yellow",italic:false,text:"Nimbus Stride"},{color:"gray",italic:false,text:" accelerates this "}],\
[{color:"gray",italic:false,text:" ability's cooldown, but each"}],\
{color:"gray",italic:false,text:" use adds time to your "},\
[{color:"yellow",italic:false,text:" Nimbus Stride"},{color:"gray",italic:false,text:" cooldown."}],\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"8"},{color:"gray",italic:false,text:" sec cooldown"}]]\
]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1..}] hotbar.0 with minecraft:torchflower_seeds[\
minecraft:item_model="minecraft:golden_axe",\
minecraft:weapon={disable_blocking_for_seconds:5},\
minecraft:enchantment_glint_override=true,\
minecraft:custom_name=[{color:"aqua",italic:false,text:"[Use]"},{color:"red",text:" Storm Bringer"}],\
minecraft:custom_data={cloudbreaker_thunder_seed:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.crop.break",\
has_consume_particles:false,\
},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:storm_bringer_atkdmg",amount:7,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:storm_bringer_atkspd",amount:-2.5,operation:"add_value"}],\
minecraft:lore=[\
{color:"gray",italic:false,text:"Throws a seed that creates"},\
{color:"gray",italic:false,text:" a lightning bolt. "},\
[{color:"yellow",italic:false,text:"Nimbus Stride"},{color:"gray",italic:false,text:" accelerates this "}],\
[{color:"gray",italic:false,text:" ability's cooldown, but each"}],\
{color:"gray",italic:false,text:" use adds time to your "},\
[{color:"yellow",italic:false,text:" Nimbus Stride"},{color:"gray",italic:false,text:" cooldown."}],\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"8"},{color:"gray",italic:false,text:" sec cooldown"}]]\
] 1

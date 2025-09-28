# classes/artillery/pmt_artillery_inv_bow_and_arrow.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays ability item for Propulsion Blast
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Power Shot charge
#	cv_F	:	Power Shot cooldown, in ms
#	cv_G	:	
#	cv_H	:	

# Infinibow
execute unless items entity @a[tag=t_pm_owner,limit=1] hotbar.0 minecraft:bow run clear @a[tag=t_pm_owner,limit=1] minecraft:bow

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=..0}] hotbar.0 with minecraft:bow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Infinibow"},\
minecraft:enchantment_glint_override=false,\
minecraft:enchantments={infinity:1}]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1..}] hotbar.0 with minecraft:bow[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Infinibow"},\
minecraft:enchantment_glint_override=true,\
minecraft:enchantments={infinity:1,power:1,punch:3}]

# Arrow

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=..0}] hotbar.6 with minecraft:arrow[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Passive)"},{color:"white",text:" Power Shot"}],\
minecraft:custom_data={artillery_power_shot:1},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Empowers your next shot"},\
{color:"gray",italic:false,text:" with bonus damage, "},\
{color:"gray",italic:false,text:" knockback, and slowness."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"3"},{color:"gray",italic:false,text:" sec cooldown"}]\
]\
]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1..}] hotbar.6 with minecraft:tipped_arrow[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Passive)"},{color:"white",text:" Power Shot"}],\
minecraft:custom_data={artillery_power_shot:1},\
minecraft:tooltip_display={hidden_components:["minecraft:potion_contents"]},\
minecraft:potion_contents={\
potion:"minecraft:slowness"},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Empowers your next shot"},\
{color:"gray",italic:false,text:" with bonus damage, "},\
{color:"gray",italic:false,text:" knockback, and slowness."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"3"},{color:"gray",italic:false,text:" sec cooldown"}]\
]\
]

# classes/titan/pmt_titan_inv_power_strike.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Power Strike icon
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_B=..0}] hotbar.1 with minecraft:gray_stained_glass_pane[\
minecraft:custom_name={italic:false,color:"gray",text:"Ability on Cooldown"}\
]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_B=1..}] hotbar.1 with minecraft:golden_axe[\
minecraft:damage=31,\
minecraft:enchantments={knockback:5},\
minecraft:tooltip_display={hidden_components:["minecraft:enchantments"]},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:power_strike_atkdmg",amount:5,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:power_strike_atkspd",amount:-2.5,operation:"add_value"}],\
minecraft:custom_name=[{color:"green",italic:false,text:"[Attack]"},{color:"white",text:" Power Strike"}],\
minecraft:lore=[\
{color:"gray",italic:false,text:"Strong knockback attack"},\
{color:"gray",italic:false,text:" that slows and damages"},\
{color:"gray",italic:false,text:" if you hit them into a wall."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"7"},{color:"gray",italic:false,text:" sec cooldown"}]\
]] 1

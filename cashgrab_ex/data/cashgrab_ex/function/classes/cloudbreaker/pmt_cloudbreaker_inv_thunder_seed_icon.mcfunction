# classes/cloudbreaker/pmt_cloudbreaker_inv_thunder_seed_icon.mcfunction
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

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=..0}] hotbar.1 with minecraft:gray_stained_glass_pane[\
minecraft:custom_name={italic:false,color:"gray",text:"Ability on Cooldown"}\
] 1

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1..}] hotbar.1 with minecraft:torchflower_seeds[\
minecraft:custom_name=[{color:"aqua",italic:false,text:"[Use]"},{color:"white",text:" Thunder Seed"}],\
minecraft:custom_data={cloudbreaker_thunder_seed:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.crop.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Throws a seed that creates"},\
{color:"gray",italic:false,text:" a lightning bolt."},\
{color:"dark_gray",italic:false,text:"---"},\
[{color:"gray",italic:false,text:"While "},{color:"yellow",italic:false,text:"Nimbus Stride"},{color:"gray",italic:false,text:" is active:"}],\
{color:"gold",italic:false,text:"+ This ability cools down quickly"},\
{color:"red",italic:false,text:"- Using this ability adds time to "},\
[{color:"red",italic:false,text:"    your "},{color:"yellow",italic:false,text:"Nimbus Stride"},{color:"red",italic:false,text:" cooldown"}],\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"8"},{color:"gray",italic:false,text:" sec cooldown"}]]\
] 1

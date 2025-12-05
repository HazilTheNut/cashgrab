# classes/griefer/pmt_inv_creeper_conduit.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Displays ability item for Creeper Conduit
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper Conduit cooldown (in ms)
#	cv_D	:	Creeper Conduit charge
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_D=..0}] hotbar.0 with minecraft:stick[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Creeper Conduit"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:flame_staff_atkdmg",amount:4,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:flame_staff_atkspd",amount:-1.5,operation:"add_value"}],\
minecraft:enchantments={fire_aspect:1},\
minecraft:lore=[\
{color:"dark_gray",italic:false,text:"---"},\
{color:"gray",italic:false,text:"Releases an ignited creeper."},\
{color:"gray",italic:false,text:"You take reduced damage from"},\
{color:"gray",italic:false,text:" your creeper explosions."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"9"},{color:"gray",italic:false,text:" sec cooldown"}]\
]]

item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_D=1..}] hotbar.0 with minecraft:blaze_rod[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name=[{italic:false,color:"aqua",text:"[Use]"},{italic:false,color:"red",text:" Creeper Conduit"}],\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:flame_staff_atkdmg",amount:4,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:flame_staff_atkspd",amount:-1.5,operation:"add_value"}],\
minecraft:enchantments={fire_aspect:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.crop.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
{color:"dark_gray",italic:false,text:"---"},\
{color:"gray",italic:false,text:"Releases an ignited creeper."},\
{color:"gray",italic:false,text:"You take reduced damage from"},\
{color:"gray",italic:false,text:" your creeper explosions."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"9"},{color:"gray",italic:false,text:" sec cooldown"}]\
]]

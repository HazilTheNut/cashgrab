# classes/cloudbreaker/pmt_cloudbreaker_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$execute if score @a[tag=t_pm_owner,limit=1] team_id matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:white_dye[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Toss)"},{color:"white",text:" Nimbus Stride"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"For a brief period, you gain"},\
{color:"gray",italic:false,text:" increased speed and clouds"},\
{color:"gray",italic:false,text:" form beneath you, allowing"},\
{color:"gray",italic:false,text:" you to run through the air"},\
{color:"gray",italic:false,text:" and climb up high."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"8"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]] $(charges)

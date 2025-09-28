# classes/griefer/pmt_griefer_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:blaze_powder[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Toss)"},{color:"white",text:" Crash Landing"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Rockets up into the air, causing"},\
{color:"gray",italic:false,text:" an explosion upon landing."},\
{color:"gray",italic:false,text:"Jumping increases the height"},\
{color:"gray",italic:false,text:" you gain from this ability."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"9"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]\
] $(charges)

# classes/skirmisher/pmt_skirmisher_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:string[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"[Toss]"},{color:"white",text:" Sword Boomerang"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Throws out your held sword"},\
{color:"gray",italic:false,text:" as a boomerang."},\
{color:"gray",italic:false,text:"Catching the boomerang grants"},\
{color:"gray",italic:false,text:" bonus speed and refunds part"},\
{color:"gray",italic:false,text:" of the cooldown."},\
{color:"gray",italic:false,text:"The boomerang is lost if it hits"},\
{color:"gray",italic:false,text:" solid terrain."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"13"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]\
] $(charges)

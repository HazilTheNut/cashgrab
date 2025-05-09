# classes/ranger/pmt_ranger_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:flint[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"[Toss]"},{color:"white",text:" Craft Arrows"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Replenishes your arrows"},\
{color:"gray",italic:false,text:" and instantly reloads"},\
{color:"gray",italic:false,text:" your crossbow."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"15"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]] $(charges)

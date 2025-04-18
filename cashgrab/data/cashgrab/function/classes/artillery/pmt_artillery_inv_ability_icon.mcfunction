# classes/artillery/pe_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:firework_rocket[\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"[Toss]"},{color:"white",text:" Rocket Barrage"}],\
minecraft:tooltip_display={hidden_components:["minecraft:fireworks"]},\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Fires a barrage of missiles."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"8"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]] $(charges)

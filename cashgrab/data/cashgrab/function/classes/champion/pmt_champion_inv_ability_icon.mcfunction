# classes/champion/pmt_champion_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$execute if score @a[tag=t_pm_owner,limit=1] team_id matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:yellow_dye[\
minecraft:item_model="minecraft:glowstone_dust",\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Toss)"},{color:"white",text:" Valiant Charge"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Grants you a speed boost."},\
{color:"gray",italic:false,text:" Afterwards, you gain absorption."},\
{color:"gray",italic:false,text:"The absorption is stronger"},\
{color:"gray",italic:false,text:" when at low health."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"14"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]] $(charges)

$execute if score @a[tag=t_pm_owner,limit=1] team_id matches 1.. run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:yellow_dye[\
minecraft:item_model="minecraft:glowstone_dust",\
minecraft:custom_name=[{color:"light_purple",italic:false,text:"(Toss)"},{color:"white",text:" Valiant Charge"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Grants you and nearby allies"},\
{color:"gray",italic:false,text:" a speed boost."},\
{color:"gray",italic:false,text:"Afterwards, grants you and"},\
{color:"gray",italic:false,text:" nearby allies absorption."},\
{color:"gray",italic:false,text:"The absorption is stronger"},\
{color:"gray",italic:false,text:" when at low health."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"yellow",italic:false,text:"14"},{color:"gray",italic:false,text:" sec cooldown for "},{color:"yellow",italic:false,text:"1"},{color:"gray",italic:false,text:" charge"}]\
]] $(charges)


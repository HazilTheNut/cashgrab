# classes/mapmaker/pmt_mapmaker_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:filled_map[\
minecraft:custom_name=[{color:"red",italic:false,text:"<Class>"},{color:"white",text:" Mapmaker"}],\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Provides useful tools"},\
{color:"dark_gray",italic:true,text:" for mapmaking."},\
]] 1

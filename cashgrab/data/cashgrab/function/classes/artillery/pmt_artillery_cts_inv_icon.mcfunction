# classes/artillery/pmt_artillery_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:firework_rocket[\
minecraft:custom_name=[{color:"dark_aqua",italic:false,text:"<Class>"},{color:"white",text:" Artillery"}],\
minecraft:tooltip_display={hidden_components:["minecraft:fireworks"]},\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Fire barrages of arrows"},\
{color:"dark_gray",italic:true,text:" and missiles."},\
]] 1

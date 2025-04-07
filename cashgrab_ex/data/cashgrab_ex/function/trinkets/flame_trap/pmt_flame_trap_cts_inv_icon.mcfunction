# trinkets/flame_trap/pmt_flame_trap_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:redstone_torch[\
minecraft:item_name=[{color:"dark_green",italic:false,text:"<Trinket>"},{color:"white",text:" Flame Trap"}],\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Deploys a proximity trap"},\
{color:"gray",italic:false,text:" that explodes and damages"},\
{color:"gray",italic:false,text:" nearby enemies."},\
{color:"gray",italic:false,text:"You can have at most"},\
{color:"gray",italic:false,text:" 3 traps active at once."}]\
] 3

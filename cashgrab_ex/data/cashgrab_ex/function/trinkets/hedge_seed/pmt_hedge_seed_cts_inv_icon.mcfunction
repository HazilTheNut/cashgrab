# trinkets/hedge_seed/pmt_hedge_seed_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:mangrove_leaves[\
minecraft:item_name=[{color:"dark_green",italic:false,text:"<Trinket>"},{color:"white",text:" Hedge Seed"}],\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Tosses a seed that"},\
{color:"gray",italic:false,text:" grows into a large"},\
{color:"gray",italic:false,text:" hedge wall."}]\
] 2

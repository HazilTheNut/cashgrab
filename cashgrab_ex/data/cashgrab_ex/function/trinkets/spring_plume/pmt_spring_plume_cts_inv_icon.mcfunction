# trinkets/spring_plume/pmt_spring_plume_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:feather[\
minecraft:item_name=[{color:"dark_green",italic:false,text:"<Trinket>"},{color:"white",text:" Spring Plume"}],\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Grants you brief burst of"},\
{color:"gray",italic:false,text:" speed, jump height, and"},\
{color:"gray",italic:false,text:" slow falling."},\
{color:"gray",italic:false,text:"Removes slowing and"},\
{color:"gray",italic:false,text:" grabbing effects."}],\
] 3

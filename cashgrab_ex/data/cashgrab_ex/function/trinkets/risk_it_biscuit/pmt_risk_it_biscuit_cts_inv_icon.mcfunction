# trinkets/risk_it_biscuit/pmt_risk_it_biscuit_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:clay_ball[\
minecraft:item_name=[{color:"dark_green",italic:false,text:"<Trinket>"},{color:"white",text:" Risk-It Biscuit"}],\
minecraft:enchantment_glint_override=false,\
minecraft:custom_data={is_cts_icon:1},\
minecraft:item_model="minecraft:cookie",\
minecraft:lore=[\
{color:"gray",italic:false,text:"Damages you to grant you"},\
{color:"gray",italic:false,text:" speed and strength"},\
{color:"gray",italic:false,text:" for a short period."},\
{color:"gray",italic:false,text:"For the duration, scoring"},\
{color:"gray",italic:false,text:" kills heals you for a"},\
{color:"gray",italic:false,text:" large amount."}],\
] 2

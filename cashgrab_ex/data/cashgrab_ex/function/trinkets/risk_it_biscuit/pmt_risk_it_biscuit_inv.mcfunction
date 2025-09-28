# trinkets/risk_it_biscuit/pmt_risk_it_biscuit_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into the provided inventory slot
#
# Arguments:
#	charges		: Number of charges remaining
#	charges_max	: Maximum number of charges remaining
#	slot		: Slot to insert item

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:clay_ball[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use $(charges)/$(charges_max)]"},{color:"white",text:" Risk-It Biscuit"}],\
minecraft:enchantment_glint_override=false,\
minecraft:custom_data={is_trinket:1},\
minecraft:item_model="minecraft:cookie",\
minecraft:consumable={\
consume_seconds:0.5f,\
animation:"eat",\
sound:"entity.generic.eat",\
},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Damages you to grant you"},\
{color:"gray",italic:false,text:" speed and strength"},\
{color:"gray",italic:false,text:" for a short period."},\
{color:"gray",italic:false,text:"For the duration, scoring"},\
{color:"gray",italic:false,text:" kills heals you for a"},\
{color:"gray",italic:false,text:" large amount."}],\
] $(charges)

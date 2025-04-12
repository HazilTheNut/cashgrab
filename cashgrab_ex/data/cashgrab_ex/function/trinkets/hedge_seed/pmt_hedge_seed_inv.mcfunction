# trinkets/hedge_seed/pmt_hedge_seed_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into the provided inventory slot
#
# Arguments:
#	charges		: Number of charges remaining
#	slot		: Slot to insert item

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:mangrove_leaves[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use]"},{color:"white",text:" Hedge Seed"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"block.grass.break",\
has_consume_particles:false,\
},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Tosses a seed that"},\
{color:"gray",italic:false,text:" grows into a large"},\
{color:"gray",italic:false,text:" hedge wall."}]\
] $(charges)

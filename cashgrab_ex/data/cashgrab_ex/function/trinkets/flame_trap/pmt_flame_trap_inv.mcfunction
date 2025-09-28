# trinkets/flame_trap/pmt_flame_trap_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:redstone_torch[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use $(charges)/$(charges_max)]"},{color:"white",text:" Flame Trap"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.blaze.shoot",\
has_consume_particles:false,\
},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Deploys a proximity trap"},\
{color:"gray",italic:false,text:" that explodes and damages"},\
{color:"gray",italic:false,text:" nearby enemies."},\
{color:"gray",italic:false,text:"You can have at most"},\
{color:"gray",italic:false,text:" 3 traps active at once."}]\
] $(charges)

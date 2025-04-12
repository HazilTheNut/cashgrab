# trinkets/echo_bolt/pmt_echo_bolt_inv.mcfunction
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

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_inv: slot: $(slot) ; charges: $(charges)"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:echo_shard[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use]"},{color:"white",text:" Echo Bolt"}],\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"block.amethyst_block.fall",\
has_consume_particles:false,\
},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Fires a beam that"},\
{color:"gray",italic:false,text:" damages and slows."},\
{color:"gray",italic:false,text:"Beams that hit"},\
{color:"gray",italic:false,text:" refund their charge."}]\
] $(charges)

# trinkets/pmt_inv_vigor_flask.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges		: Number of charges remaining
#	charges_max	: Maximum number of charges remaining
#	slot		: Slot to insert item

$item replace entity @a[tag=t_pm_owner] $(slot) with minecraft:egg[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use $(charges)/$(charges_max)]"},{color:"white",text:" Test Trinket"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
{color:"gray",italic:true,text:"Makes harmless"},\
{color:"gray",italic:true,text:" fireworks"}\
],\
] $(charges)

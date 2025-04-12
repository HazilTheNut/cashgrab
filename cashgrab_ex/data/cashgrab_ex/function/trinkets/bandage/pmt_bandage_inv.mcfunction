# trinkets/bandage/pmt_bandage_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:paper[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use]"},{color:"white",text:" Bandage"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"brush",\
sound:"ui.cartography_table.take_result",\
has_consume_particles:false,\
on_consume_effects:[\
{\
type:"apply_effects",\
effects:[\
{id:"minecraft:regeneration",amplifier:3b,duration:35},\
]}\
]},\
minecraft:lore=[\
{color:"gray",italic:false,text:"Restores health."}],\
] $(charges)

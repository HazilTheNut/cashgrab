# trinkets/lava_cake/pmt_lava_cake_inv.mcfunction
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
minecraft:item_model="minecraft:cake",\
minecraft:item_name=[{color:"green",italic:false,text:"[Use $(charges)/$(charges_max)]"},{color:"white",text:" Lava Cake"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.generic.eat",\
has_consume_particles:false,\
},\
minecraft:lore=[\
[{text:"Eating this cake grants ",italic:false,color:"gray"},{text:"Fire",italic:false,color:"yellow"}],\
[{text:" Resistance ",italic:false,color:"yellow"},{text:"and clears ",italic:false,color:"gray"},{text:"Mining",italic:false,color:"yellow"}],\
[{text:" Fatigue",italic:false,color:"yellow"},{text:".",italic:false,color:"gray"}],\
[{text:"When the effect ends, you",italic:false,color:"gray"}],\
[{text:" explode",italic:false,color:"yellow"},{text:", dealing damage",italic:false,color:"gray"}],\
[{text:" to nearby enemies!",italic:false,color:"gray"}]\
]] $(charges)
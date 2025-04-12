# trinkets/smoke_screen/pmt_smoke_screen_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:ink_sac[\
minecraft:item_name=[{color:"green",italic:false,text:"[Use]"},{color:"white",text:" Smoke Screen"}],\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.egg.throw",\
has_consume_particles:false,\
},\
minecraft:lore=[\
[{text:"Fires a smoke bomb that briefly",italic:false,color:"gray"}],\
[{text:" blinds anyone near it.",italic:false,color:"gray"}]\
]] $(charges)
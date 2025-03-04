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
#	slot		: Slot to insert item

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:clay_ball[\
minecraft:item_model="cake",\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Lava Cake\"}]",\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.generic.eat",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Eating this cake grants\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" Fire Resistance and Haste,\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and clears Mining Fatigue.\"}"]\
] $(charges)
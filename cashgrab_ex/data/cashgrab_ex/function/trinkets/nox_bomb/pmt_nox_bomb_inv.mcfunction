# trinkets/nox_bomb/pmt_nox_bomb_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:lime_dye[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Nox Bomb\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"minecraft:block.slime_block.hit",\
has_consume_particles:false,\
},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Lobs a poison bomb that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" splits into more bombs.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Each explosion poisons\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and slows in a wide area.\"}"]\
] $(charges)

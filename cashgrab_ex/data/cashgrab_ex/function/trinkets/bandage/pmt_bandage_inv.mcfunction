# trinkets/bandage/pmt_bandage_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges		: Number of charges remaining
#	slot		: Slot to insert item

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_inv: slot: $(slot) ; charges: $(charges)"

clear @a[tag=t_pm_owner,limit=1] minecraft:filled_map[!minecraft:custom_data={is_cts_icon:1}]

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:map[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Bandage\"}]",\
minecraft:custom_data={is_trinket:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Restores health\"}"],\
] $(charges)

# trinkets/bandage/pmt_bandage_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon: slot:'$(slot)'"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:map[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Bandage\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Restores health\"}"],\
] 2

# trinkets/test_item/pmt_test_item_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

#$tellraw @a[tag=t_debug] "trinkets/test_item/pmt_test_item_cts_inv_icon: slot:'$(slot)'"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:egg[\
minecraft:item_name="[{\"color\":\"red\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Test Item\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":true,\"text\":\"Makes harmless\"}",\
"{\"color\":\"gray\",\"italic\":true,\"text\":\" fireworks\"}"],\
minecraft:enchantment_glint_override=true,\
] 1

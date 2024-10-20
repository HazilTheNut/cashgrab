# trinkets/accelerator/pmt_accelerator_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:experience_bottle[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Accelerator\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Speeds up your ability\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" cooldowns for a\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" short period.\"}"],\
] 1

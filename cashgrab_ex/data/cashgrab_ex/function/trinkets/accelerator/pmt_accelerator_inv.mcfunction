# trinkets/accelerator/pmt_accelerator_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:experience_bottle[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Accelerator\"}]",\
minecraft:custom_data={is_trinket:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Speeds up your ability\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" cooldowns for a\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" short period.\"}"],\
] $(charges)

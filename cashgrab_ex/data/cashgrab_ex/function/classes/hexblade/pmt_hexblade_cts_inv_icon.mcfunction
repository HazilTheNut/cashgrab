# classes/hexblade/pmt_hexblade_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:silence_armor_trim_smithing_template[\
minecraft:item_name="[{\"color\":\"dark_aqua\",\"italic\":false,\"text\":\"<Class>\"},{\"color\":\"white\",\"text\":\" Hexblade\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Hex your enemies and\"}",\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\" get the drop on them.\"}",\
]] 1

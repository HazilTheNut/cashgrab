# classes/battlesmith/pmt_battlesmith_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:anvil[\
minecraft:item_name="[{\"color\":\"dark_aqua\",\"italic\":false,\"text\":\"<Class>\"},{\"color\":\"white\",\"text\":\" Battlesmith\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Melt scrap and upgrade\"}",\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\" your weapon.\"}",\
]] 1

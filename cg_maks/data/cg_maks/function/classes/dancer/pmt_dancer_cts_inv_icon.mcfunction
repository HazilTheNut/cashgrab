# classes/dancer/pmt_dancer_cts_inv_icon
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:note_block[\
minecraft:item_name="[{\"color\":\"dark_aqua\",\"italic\":false,\"text\":\"<Class>\"},{\"color\":\"white\",\"text\":\" Dancer\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Keep up the tempo for","color":"dark_gray","italic":true}]',\
'["",{"text":" an extravagant flourish.","italic":true,"color":"dark_gray"}]'\
]] 1
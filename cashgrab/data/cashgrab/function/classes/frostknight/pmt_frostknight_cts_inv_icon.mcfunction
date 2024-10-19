# classes/frostknight/pmt_frostknight_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:diamond[\
minecraft:item_name="[{\"color\":\"dark_aqua\",\"italic\":false,\"text\":\"<Class>\"},{\"color\":\"white\",\"text\":\" Frost Knight\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Cover the battlefield\"}",\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\" with an icy chill.\"}",\
]] 1
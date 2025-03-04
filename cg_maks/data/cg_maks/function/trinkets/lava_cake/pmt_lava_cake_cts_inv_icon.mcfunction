# trinkets/lava_cakee/pmt_lava_cake_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:cake[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Lava Cake\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Eating this cake grants\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" Fire Resistance and Haste,\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and clears Mining Fatigue.\"}"\
]] 1
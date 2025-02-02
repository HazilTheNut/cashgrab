# trinkets/nox_bomb/pmt_nox_bomb_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:lime_dye[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Nox Bomb\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Lobs a poison bomb that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" splits into more bombs\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" on impact.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Each explosion poisons\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" and slows in a wide area.\"}"]\
] 2

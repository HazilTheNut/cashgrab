# trinkets/echo_bolt/pmt_echo_bolt_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:echo_shard[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Echo Bolt\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Fires a beam that\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" damages and slows.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Beams that hit\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" refund their charge.\"}"]\
] 3

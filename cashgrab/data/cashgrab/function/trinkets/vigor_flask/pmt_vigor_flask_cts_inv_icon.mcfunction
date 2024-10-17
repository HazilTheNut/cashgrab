# trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon: slot:'$(slot)'"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:potion[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Vigor Flask\"}]",\
minecraft:enchantment_glint_override=false,\
minecraft:potion_contents={custom_color:16598149,custom_effects:[\
{id:"minecraft:regeneration",amplifier:4,duration:40},\
{id:"minecraft:speed",amplifier:0,duration:100},\
]}] 1

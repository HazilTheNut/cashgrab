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

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_cts_inv_icon: slot:'$(slot)'"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:potion[\
minecraft:custom_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Vigor Flask\"}]",\
minecraft:enchantment_glint_override=false,\
minecraft:custom_data={is_cts_icon:1},\
minecraft:potion_contents={custom_color:16598149,custom_effects:[\
{id:"minecraft:instant_health",amplifier:2,duration:0},\
{id:"minecraft:regeneration",amplifier:2,duration:260},\
{id:"minecraft:speed",amplifier:0,duration:260},\
]}] 1

# base/pmt_inv_trinket.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges		: Number of charges remaining

$item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Vigor Flask\"}]",\
minecraft:enchantment_glint_override=false,\
minecraft:potion_contents={custom_color:16598149,custom_effects:[\
{id:"minecraft:regeneration",amplifier:4,duration:40},\
{id:"minecraft:speed",amplifier:0,duration:100},\
]}] $(charges)
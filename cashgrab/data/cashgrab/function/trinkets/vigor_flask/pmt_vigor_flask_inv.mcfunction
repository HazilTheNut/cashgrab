# trinkets/vigor_flask/pmt_vigor_flask_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into hotbar slot 3
#
# Arguments:
#	charges		: Number of charges remaining
#	slot		: Slot to insert item

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_inv: slot: $(slot) ; charges: $(charges)"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:potion[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Vigor Flask\"}]",\
minecraft:custom_data={is_trinket:1},\
minecraft:enchantment_glint_override=false,\
minecraft:potion_contents={custom_color:16598149,custom_effects:[\
{id:"minecraft:regeneration",amplifier:4,duration:37},\
{id:"minecraft:speed",amplifier:0,duration:100},\
]}] $(charges)

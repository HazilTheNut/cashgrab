# trinkets/vigor_flask/pmt_vigor_flask_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped trinket item into the provided inventory slot
#
# Arguments:
#	charges		: Number of charges remaining
#	slot		: Slot to insert item

#$tellraw @a[tag=t_debug] "trinkets/vigor_flask/pmt_vigor_flask_inv: slot: $(slot) ; charges: $(charges)"

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:potion[\
minecraft:custom_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Vigor Flask\"}]",\
minecraft:custom_data={is_trinket:1},\
minecraft:enchantment_glint_override=false,\
minecraft:potion_contents={custom_color:16598149,custom_effects:[\
{id:"minecraft:instant_health",amplifier:2,duration:0},\
{id:"minecraft:regeneration",amplifier:2,duration:260},\
{id:"minecraft:speed",amplifier:0,duration:260},\
]}] $(charges)

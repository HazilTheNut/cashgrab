# trinkets/spring_plume/pmt_spring_plume_inv.mcfunction
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

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:feather[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Use]\"},{\"color\":\"white\",\"text\":\" Spring Plume\"}]",\
minecraft:enchantment_glint_override=true,\
minecraft:custom_data={is_trinket:1},\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.wind_charge.wind_burst",\
on_consume_effects:[\
{\
type:"apply_effects",\
effects:[\
{id:"minecraft:speed",amplifier:3b,duration:60},\
{id:"minecraft:jump_boost",amplifier:5b,duration:60},\
{id:"minecraft:slow_falling",amplifier:0b,duration:60}\
]},\
{\
type:"remove_effects",\
effects:"minecraft:slowness"\
}\
]},\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Grants you brief burst of\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" speed, jump height, and\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" slow falling.\"}"],\
] $(charges)

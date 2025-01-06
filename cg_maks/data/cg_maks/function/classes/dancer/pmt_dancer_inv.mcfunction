# classes/dancer/pmt_dancer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Dancer class for the command executor
#
# Arguments: (none)

# === Armor
# Helmet, Chestplate, Leggings always the same
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:leather_helmet[\
minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color={rgb:15961002}\
]

item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[\
minecraft:dyed_color={rgb:15961002},\
minecraft:unbreakable={show_in_tooltip:false},\
minecraft:trim={pattern:vex,material:gold}\
]

item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:golden_leggings[\
minecraft:unbreakable={show_in_tooltip:false}\
]

#Boots have variable speed depending on current Tempo state.
function cg_maks:classes/dancer/pmt_dancer_inv_armor

# === Hotbar
# Lucky Cane
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:wooden_hoe[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Lucky Cane\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:luckycane_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:luckycane_atkspd",amount:-2,operation:"add_value"}]]

# Tempo Icon
function cg_maks:classes/dancer/pmt_dancer_inv_tempo
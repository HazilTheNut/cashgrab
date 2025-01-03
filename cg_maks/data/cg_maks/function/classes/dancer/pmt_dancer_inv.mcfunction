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

# === Hotbar
# Lucky Cane
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:wooden_hoe[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Lucky Cane\"}",\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:nightreaver_atkdmg",amount:6,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:nightreaver_atkspd",amount:-2,operation:"add_value"}]]

# Tempo Icon
function cg_maks:classes/dancer/pmt_dancer_inv_tempo
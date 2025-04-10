# tutorial/trainee/pmt_trainee_inv_equipment.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates weapon and armor for the Trainee class for the command executor
#
# Arguments: (none)

# Progression of Trainee class
#   0   =   Has nothing
#   1   =   Has Trainee selectable in inventory
#   2   =   Has inventory, Toss ability
#   3   =   Has inventory, Toss ability, Crouch ability
#   4   =   Has inventory, Toss ability, Crouch ability, Passive ability
#   5   =   Has inventory, Toss ability, Crouch ability, Passive ability, Trinket

# =============================
# Armor
item replace entity @a[tag=t_pm_owner,limit=1] armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.legs with minecraft:leather_leggings[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]}]
item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with minecraft:leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:4,operation:"add_value"}\
]]

# =============================
# Practice Sword
item replace entity @a[tag=t_pm_owner,limit=1] hotbar.0 with minecraft:wooden_sword[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable"]},\
minecraft:custom_name={italic:false,color:"red",text:"Practice Sword"},\
minecraft:attribute_modifiers=[\
{type:"attack_damage",slot:"mainhand",id:"cashgrab:machete_atkdmg",amount:3,operation:"add_value"},\
{type:"attack_speed",slot:"mainhand",id:"cashgrab:machete_atkspd",amount:-2,operation:"add_value"}]]

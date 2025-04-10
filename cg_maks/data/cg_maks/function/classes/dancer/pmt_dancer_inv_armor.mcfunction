# classes/dancer/pmt_dancer_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates Armor inventory for the Dancer class for the command executor
#
# Arguments: (none)

# Boots! +5% speed per stack.
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
dyed_color=15961002,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:3,operation:"add_value"}\
]]

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
dyed_color=15961002,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.25,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:3,operation:"add_value"}\
]]

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
dyed_color=15961002,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:3,operation:"add_value"}\
]]

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run item replace entity @a[tag=t_pm_owner,limit=1] armor.feet with leather_boots[minecraft:unbreakable={},\
minecraft:tooltip_display={hidden_components:["minecraft:unbreakable","minecraft:dyed_color"]},\
dyed_color=15961002,\
minecraft:attribute_modifiers=[\
{type:"movement_speed",slot:"feet",id:"cashgrab:speed_bonus",amount:0.35,operation:"add_multiplied_base"},\
{type:"armor",slot:"feet",id:"cashgrab:boots_armor",amount:3,operation:"add_value"}\
]]
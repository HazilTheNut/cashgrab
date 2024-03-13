# classes/test_d/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = -4
#
# Summary: Populates inventory for the TEST_C class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @s armor.head with minecraft:golden_helmet
item replace entity @s armor.chest with minecraft:golden_chestplate
item replace entity @s armor.legs with minecraft:golden_leggings
item replace entity @s armor.feet with minecraft:golden_boots

# Hotbar
item replace entity @s hotbar.0 with minecraft:wooden_sword

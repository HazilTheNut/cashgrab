# classes/test_b/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = -2
#
# Summary: Populates inventory for the TEST_B class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @s armor.head with minecraft:leather_helmet
item replace entity @s armor.chest with minecraft:leather_chestplate
item replace entity @s armor.legs with minecraft:leather_leggings
item replace entity @s armor.feet with minecraft:leather_boots

# Hotbar
item replace entity @s hotbar.0 with minecraft:netherite_sword

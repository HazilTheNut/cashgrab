# classes/test_c/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = -3
#
# Summary: Populates inventory for the TEST_C class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @s armor.head with minecraft:chainmail_helmet
item replace entity @s armor.chest with minecraft:chainmail_chestplate
item replace entity @s armor.legs with minecraft:chainmail_leggings
item replace entity @s armor.feet with minecraft:chainmail_boots

# Hotbar
item replace entity @s hotbar.0 with minecraft:stone_sword

# classes/test_a/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = -1
#
# Summary: Populates inventory for the TEST class for the command executor
#
# Arguments: (none)

# Armor
item replace entity @s armor.head with minecraft:iron_helmet
item replace entity @s armor.chest with minecraft:iron_chestplate
item replace entity @s armor.legs with minecraft:iron_leggings
item replace entity @s armor.feet with minecraft:iron_boots

# Hotbar
item replace entity @s hotbar.0 with minecraft:iron_sword

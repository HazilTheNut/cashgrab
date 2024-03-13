# classes/test_a/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = -1
#
# Summary: Equips the TEST_A class onto the command executor
#
# Arguments: (none)

scoreboard players set @s ability_cfg_cooldown_ticks 100
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1


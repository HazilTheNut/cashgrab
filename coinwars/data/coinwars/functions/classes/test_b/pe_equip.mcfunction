# classes/test_b/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = -2
#
# Summary: Equips the TEST_B class onto the command executor
#
# Arguments: (none)

scoreboard players set @s ability_cfg_cooldown_ticks 100
scoreboard players set @s ability_cfg_charges 3
scoreboard players set @s ability_charges 3

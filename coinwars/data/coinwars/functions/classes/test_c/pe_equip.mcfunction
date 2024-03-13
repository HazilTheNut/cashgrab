# classes/test_c/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = -3
#
# Summary: Equips the TEST_C class onto the command executor
#
# Arguments: (none)

scoreboard players set @s ability_cfg_cooldown_ticks 20
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1
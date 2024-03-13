# classes/test_d/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = -4
#
# Summary: Equips the TEST_C class onto the command executor
#
# Arguments: (none)

scoreboard players set @s ability_cfg_cooldown_ticks 40
scoreboard players set @s ability_cfg_charges 10
scoreboard players set @s ability_charges 10

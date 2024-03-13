# classes/mapmaker/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = -10
#
# Summary: Equips the Mapmaker class onto the command executor
#
# Arguments: (none)

scoreboard players set @s ability_cfg_cooldown_ticks 10
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1

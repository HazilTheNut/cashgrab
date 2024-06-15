# classes/test_b/missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: test class b's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

$scoreboard players set @s temp_A $(end_reason)

particle lava ~ ~ ~ 0.1 0.1 0.1 1 15

execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~ ~ ~ 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~ ~ ~1 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~ ~1 ~ 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~ ~1 ~1 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~1 ~ ~ 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~1 ~ ~1 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~1 ~1 ~ 0 0 0 1 0
execute if entity @s[scores={temp_A=1}] align xyz run particle minecraft:end_rod ~1 ~1 ~1 0 0 0 1 0

$tellraw @a[tag=t_debug] "classes/test_b/missile_end end_reason: $(end_reason)"

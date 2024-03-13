# classes/test_c/raycast_end.mcfunction
#
# Context:
#	at: end of raycast
#
# Summary: test class c's racyast end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (1 = hit block terrain, 2 = hit entity, 3 = expired)

#particle lava ~ ~ ~ 0.1 0.1 0.1 1 15

#execute align xyz run particle minecraft:end_rod ~ ~ ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~ ~ ~1 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~ ~1 ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~ ~1 ~1 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~ ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~ ~1 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~1 ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~1 ~1 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~ ~2 ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~ ~2 ~1 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~2 ~ 0 0 0 1 0
#execute align xyz run particle minecraft:end_rod ~1 ~2 ~1 0 0 0 1 0

#summon armor_stand ~ ~ ~ {NoGravity:1b}

#tp @s ~ ~ ~

$scoreboard players set @s temp_A $(end_reason)

# bottom square
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~0.5 ~ ~ 0.2 0 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~ ~ ~0.5 0 0 0.2 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~0.5 ~ ~1 0.2 0 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~1 ~ ~0.5 0 0 0.2 0 5
# top square
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~0.5 ~2 ~ 0.2 0 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~ ~2 ~0.5 0 0 0.2 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~0.5 ~2 ~1 0.2 0 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~1 ~2 ~0.5 0 0 0.2 0 5
# vertical struts
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~ ~1 ~ 0 0.4 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~1 ~1 ~ 0 0.4 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~ ~1 ~1 0 0.4 0 0 5
execute unless entity @s[scores={temp_A=2}] align xz run particle enchanted_hit ~1 ~1 ~1 0 0.4 0 0 5

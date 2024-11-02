# util/npe_col_detect_terrain.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the location being checked for collision
#
# Summary: Runs collision detection algorithm for terrain at the next position given by delta_x, delta_y, and delta_z
#
# Arguments:
#	delta_x				: Change in x position towards next position
#	delta_y				: Change in y position towards next position
#	delta_z				: Change in z position towards next position
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#
# Returns: 1 if the collision detection found solid terrain and 0 otherwise

#execute positioned ~ ~ ~ run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_line"}

$execute unless block ~$(delta_x) ~$(delta_y) ~$(delta_z) $(col_terrain_allowed) run return 1

# Check for corners along x+y, x+z, or y+z diagonals (2D diagonals in 3D space)
scoreboard players set @s __col_terrain_count 0
$execute unless block ~$(delta_x) ~ ~ $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1
$execute unless block ~ ~$(delta_y) ~ $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1
$execute unless block ~ ~ ~$(delta_z) $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1

#$execute if entity @s[scores={__col_terrain_count=2..}] positioned ~$(delta_x) ~ ~ run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dx"}
#$execute if entity @s[scores={__col_terrain_count=2..}] positioned ~ ~$(delta_y) ~ run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dy"}
#$execute if entity @s[scores={__col_terrain_count=2..}] positioned ~ ~ ~$(delta_z) run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dz"}

execute if entity @s[scores={__col_terrain_count=2..}] run return 1

# Check for corners along x+y+z diagonals (3D diagonals in 3D space)
scoreboard players set @s __col_terrain_count 0
$execute unless block ~$(delta_x) ~$(delta_y) ~ $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1
$execute unless block ~ ~$(delta_y) ~$(delta_z) $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1
$execute unless block ~$(delta_x) ~ ~$(delta_z) $(col_terrain_allowed) run scoreboard players add @s __col_terrain_count 1

#$execute if entity @s[scores={__col_terrain_count=3..}] positioned ~$(delta_x) ~$(delta_y) ~ run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dxy"}
#$execute if entity @s[scores={__col_terrain_count=3..}] positioned ~ ~$(delta_y) ~$(delta_z) run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dyz"}
#$execute if entity @s[scores={__col_terrain_count=3..}] positioned ~$(delta_x) ~ ~$(delta_z) run function cashgrab:base/test/place_col_test_timer {func_npe_tick:"cashgrab:base/test/timer_tick_dxz"}

execute if entity @s[scores={__col_terrain_count=3..}] run return 1

return 0

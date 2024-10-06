# base/npe_raycast_fit_player.mcfunction
#
# Context:
#	as: an entity
#	at: raycast endpoint where !col_terrain_allowed is at this location
#
# Summary: Runs func_end either raised or lowered to account for potentially ascending ledges or descending below ceilings
#
# Arguments (must be from cashgrab:rc_args storage):
#	delta_x				: Change in x position per step of raycast
#	delta_y				: Change in y position per step of raycast
#	delta_z				: Change in z position per step of raycast
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_end			: String function name to run when raycast completes
#
# Returns: 1 if func_end was ran and 0 if not

# Notation:
# (position to the right is horizontal distance forward and up/down is vertical distance forward)
# -> or ^ = (points to) raycast next position 
# + = raycast current position
# .	= col_terrain_allowed
# # = not col_terrain_allowed
# _ = bottom slab
# " = top slab

# Get delta_y, which determines if raycaster is looking more upwards or more downwards
execute store result score @s temp_A run data get storage cashgrab:rc_args data.delta_y 1000
#tellraw @s[tag=t_debug,scores={col_terrain=1..}] [{"type":"text","text":"pe_raycast_fit_player temp_A: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]

# temp_B used to indicate if a case was encountered
scoreboard players set @s temp_B 0

# Case: descend top slab ceilings
#
#	`
#	+
#	.
#or
#	"
#	+
#	_
$execute if block ~ ~1 ~ #minecraft:slabs[type=top] if block ~ ~-1 ~ $(col_terrain_allowed) run scoreboard players set @s temp_B 1
execute if block ~ ~1 ~ #minecraft:slabs[type=top] if block ~ ~-1 ~ #minecraft:slabs[type=bottom] run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] align y positioned ~ ~-0.5 ~ run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "slab ceiling"
execute if entity @s[scores={temp_B=1..}] run return 1

# Case: descend simple ceilings
#
#	#
#	+
#	.
$execute unless block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~-1 ~ $(col_terrain_allowed) run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] positioned ~ ~-1 ~ align y run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "simple ceiling"
execute if entity @s[scores={temp_B=1..}] run return 1

# Case: observe slab ceilings
#
#	`
#	.
#	+
$execute if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ #minecraft:slabs[type=top] run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] align y positioned ~ ~0.5 ~ run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "observe slab ceiling"
execute if entity @s[scores={temp_B=1..}] run return 1

# Case: observe simple ceilings
#
#	#
#	.
#	+
$execute if block ~ ~1 ~ $(col_terrain_allowed) unless block ~ ~2 ~ $(col_terrain_allowed) run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] positioned ~ ~ ~ align y run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "observe ceiling"
execute if entity @s[scores={temp_B=1..}] run return 1

# Case: ascend slab ledges
#
#	  .
#	  .
#	->_
#or
#	  "
#	  .
#	->_
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ $(col_terrain_allowed) run scoreboard players set @s temp_B 1
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ #minecraft:slabs[type=top] run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) align y positioned ~ ~0.55 ~ run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "slab ledge"
execute if entity @s[scores={temp_B=1..}] run return 1

# Case: ascend simple ledges
#
#	  .
#	  .
#	->#
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) unless block ~ ~ ~ $(col_terrain_allowed) if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ $(col_terrain_allowed) run scoreboard players set @s temp_B 1
$execute if entity @s[scores={temp_B=1..}] positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) positioned ~ ~1 ~ align y positioned ~ ~0.05 ~ run function $(func_end) {end_reason:1}
#execute if entity @s[scores={temp_B=1..},tag=t_debug] run tellraw @s "simple ledge"
execute if entity @s[scores={temp_B=1..}] run return 1

return 0

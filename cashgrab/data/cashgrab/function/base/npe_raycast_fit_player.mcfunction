# base/npe_raycast_fit_player.mcfunction
#
# Context:
#	as: an entity
#	at: raycast endpoint where !col_terrain_allowed is at this location
#
# Summary: Runs func_npe_end either raised or lowered to account for potentially ascending ledges or descending below ceilings
#
# Arguments (must be from cashgrab:rc_args storage):
#	delta_x				: Change in x position per step of raycast
#	delta_y				: Change in y position per step of raycast
#	delta_z				: Change in z position per step of raycast
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_npe_end			: String function name to run when raycast completes
#
# Returns: 1 if func_npe_end was ran and 0 if not

# Notation:
# (position to the right is horizontal distance forward and up/down is vertical distance forward)
# -> or ^ = (points to) raycast next position 
# + = raycast current position
# .	= col_terrain_allowed
# # = not col_terrain_allowed
# _ = bottom slab
# " = top slab

# Get delta_y, which determines if raycaster is looking more upwards or more downwards
#execute store result score @s temp_A run data get storage cashgrab:rc_args data.delta_y 1000
#tellraw @s[tag=t_debug,scores={col_terrain=1..}] [{"type":"text","text":"pe_raycast_fit_player temp_A: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]

tag @s remove t_raycast_player_fit_case_met

#tellraw @a[tag=t_debug] "Running player fitting"

# Case: descend top slab ceilings
#
#	"
#	+
#	.
#or
#	"
#	+
#	_
$execute if block ~ ~1 ~ #minecraft:slabs[type=top] if block ~ ~-1 ~ $(col_terrain_allowed) run tag @s add t_raycast_player_fit_case_met
execute if block ~ ~1 ~ #minecraft:slabs[type=top] if block ~ ~-1 ~ #minecraft:slabs[type=bottom] run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "slab ceiling"
$execute if entity @s[tag=t_raycast_player_fit_case_met] align y positioned ~ ~-0.5 ~ run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

# Case: descend simple ceilings
#
#	#
#	+
#	.
$execute unless block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~-1 ~ $(col_terrain_allowed) run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "simple ceiling"
$execute if entity @s[tag=t_raycast_player_fit_case_met] positioned ~ ~-1 ~ align y run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

# Case: observe slab ceilings
#
#	"
#	.
#	+
$execute if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ #minecraft:slabs[type=top] run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "observe slab ceiling"
$execute if entity @s[tag=t_raycast_player_fit_case_met] align y positioned ~ ~0.5 ~ run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

# Case: observe simple ceilings
#
#	#
#	.
#	+
$execute if block ~ ~1 ~ $(col_terrain_allowed) unless block ~ ~2 ~ $(col_terrain_allowed) run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "observe ceiling"
$execute if entity @s[tag=t_raycast_player_fit_case_met] positioned ~ ~ ~ align y run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

# Case: ascend slab ledges
#
#	  .
#	  .
#	->_
#or
#	  "
#	  .
#	->_
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ $(col_terrain_allowed) run tag @s add t_raycast_player_fit_case_met
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) if block ~ ~ ~ #minecraft:slabs[type=bottom] if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ #minecraft:slabs[type=top] run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "slab ledge"
$execute if entity @s[tag=t_raycast_player_fit_case_met] positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) align y positioned ~ ~0.55 ~ run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

# Case: ascend simple ledges
#
#	  .
#	  .
#	->#
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) unless block ~ ~ ~ $(col_terrain_allowed) if block ~ ~1 ~ $(col_terrain_allowed) if block ~ ~2 ~ $(col_terrain_allowed) run tag @s add t_raycast_player_fit_case_met
#execute if entity @s[tag=t_raycast_player_fit_case_met] run tellraw @a[tag=t_debug] "simple ledge"
$execute if entity @s[tag=t_raycast_player_fit_case_met] positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) positioned ~ ~1 ~ align y positioned ~ ~0.05 ~ run function $(func_npe_end) {end_reason:20}
execute if entity @s[tag=t_raycast_player_fit_case_met] run return 1

tellraw @a[tag=t_debug] "Player fitting required no adjustments"
return 0

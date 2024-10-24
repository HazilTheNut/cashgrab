# base/npe_raycast_loop.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Performs loop of raycasting
#
# Arguments:
#	delta_x				: Change in x position per step of raycast
#	delta_y				: Change in y position per step of raycast
#	delta_z				: Change in z position per step of raycast
#	col_terrain_allowed	: Block tag or block type that describes what counts as not solid collision
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities that can collide with
#	func_npe_step			: String function name to run every tick
#	func_npe_end			: String function name to run when either the missile collides or expires

$function $(func_npe_step)

# =============================
# Subtract steps remaining and expire if at 0
scoreboard players remove @s[scores={rc_steps_remaining=1..}] rc_steps_remaining 1
execute if entity @s[scores={rc_steps_remaining=..0}] run tellraw @a[tag=t_debug] "Raycast expired"
$execute if entity @s[scores={rc_steps_remaining=..0}] run function $(func_npe_end) {end_reason:3}
execute if entity @s[scores={rc_steps_remaining=..0}] run return 0

# =============================
# Terrain hit detection
$execute store result score @s col_terrain run function cashgrab:util/npe_col_detect_terrain {delta_x:$(delta_x),delta_y:$(delta_y),delta_z:$(delta_z),col_terrain_allowed:"$(col_terrain_allowed)"}

# After colliding with terrain, attempt to fit a player if enabled
scoreboard players set @s temp_A 0
execute if entity @s[scores={col_terrain=1..,rc_fit_player=1..}] store result score @s temp_A run function cashgrab:base/npe_raycast_fit_player with storage cashgrab:rc_args data

execute if score @s col_terrain matches 1.. run tellraw @a[tag=t_debug] [{"type":"text","text":"pe_raycast_loop temp_A: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]
#tellraw @s[tag=t_debug,scores={col_terrain=1..}] [{"type":"text","text":"pe_raycast_loop rc_steps_remaining: "},{"type":"score","score":{"name":"@s","objective":"rc_steps_remaining"}}]

# Default collision func_npe_end
$execute if entity @s[scores={col_terrain=1..,temp_A=0}] run function $(func_npe_end) {end_reason:1}
execute if entity @s[scores={col_terrain=1..}] run return 0

# =============================
# Entity hit detection
scoreboard players set @s col_entity 0

# No-op function is ran as func_npe_entity_filter was ran at the very beginning of raycast
$execute if score @s col_terrain matches 0 store result score @s col_entity positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) run function cashgrab:util/npe_col_detect_entity {func_npe_entity_filter:"cashgrab:util/noop"}

$execute if entity @s[scores={col_entity=1..}] run function $(func_npe_end) {end_reason:2}
execute if entity @s[scores={col_entity=1..}] run tellraw @a[tag=t_debug] "Raycast entity collision"
execute if entity @s[scores={col_entity=1..}] run return 0

# Proceed to next step of loop
$execute positioned ~$(delta_x) ~$(delta_y) ~$(delta_z) if entity @s[scores={rc_steps_remaining=1..}] run function cashgrab:base/npe_raycast_loop_recursion with storage cashgrab:rc_args data

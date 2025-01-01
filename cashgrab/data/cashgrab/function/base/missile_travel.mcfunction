# base/missile_travel.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Performs movement and collision detection for missile
#
# Arguments:
#	vel_x					: Missile x velocity, in meters/tick
#	vel_y					: Missile y velocity, in meters/tick
#	vel_z					: Missile z velocity, in meters/tick
#	magnitude				: Scalar of strength of tracking towards potential targets
#	col_terrain_allowed		: Block tag or block type that describes what counts as not solid collision
#	func_npe_entity_filter	: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities the missile can collide with
#	func_npe_tick			: String function name to run every tick
#	func_npe_end			: String function name to run when either the missile collides or expires

# Decrement i_lifetime_ticks and run func_npe_tick or func_npe_end
scoreboard players remove @s mis_lifetime_ticks 1

$execute if entity @s[scores={mis_lifetime_ticks=..0}] run function $(func_npe_end) {end_reason:10}
execute if entity @s[scores={mis_lifetime_ticks=..0}] run tag @s add t_kill
execute if entity @s[scores={mis_lifetime_ticks=..0}] run scoreboard players reset @s
kill @s[tag=t_kill]

# func_npe_tick can run commands like tp to alter its location and facing angle and should therefore influence where it goes
# Thus func_npe_tick is ran first before generic missile movement
# Note: if you alter the facing angle of a missile, you must run util/pe_missile_calc_base_velocity to recalculate its trajectory

# Run collision detection on the next position
scoreboard players set @s __mis_has_collided 0

# =============================
# Terrain collision
$execute store result score @s col_terrain run function cashgrab:util/npe_col_detect_terrain {delta_x:$(vel_x),delta_y:$(vel_y),delta_z:$(vel_z),col_terrain_allowed:"$(col_terrain_allowed)"}

# =============================
# Entity hit detection
scoreboard players set @s col_entity 0

# Run entity collision filter function
$execute if score @s col_terrain matches 0 store result score @s col_entity positioned ~$(vel_x) ~$(vel_y) ~$(vel_z) run function cashgrab:util/npe_col_detect_entity {func_npe_entity_filter:"$(func_npe_entity_filter)"}

#tellraw @a[tag=t_debug] [{"type":"text","text":"Missile tags: "},{"type":"nbt","nbt":"Tags","entity":"@s"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  Candidates: "},{"type":"selector","selector":"@e[tag=t_collision_candidate]"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"  Found: "},{"type":"selector","selector":"@e[tag=t_collision_found]"}]

# = if either col_terrain or col_entity == 1
execute if entity @s[scores={col_terrain=1..}] run scoreboard players set @s __mis_has_collided 1
execute if entity @s[scores={col_entity=1..}] run scoreboard players set @s __mis_has_collided 1

# If no collision, travel forwards
$execute if entity @s[scores={__mis_has_collided=0}] run tp @s ~$(vel_x) ~$(vel_y) ~$(vel_z) ~$(tracking_dyaw) ~$(tracking_dpitch)

# If there is a collision, do one of three things:
# 	A) If the missile has no gravity, run func_npe_end and then destroy itself
# 	B) If the missile has gravity and has the t_missile_fall tag, run func_npe_end and then destroy itself
# 	C) If the missile has gravity and does not have the t_missile_fall tag, apply t_missile_fall tag

# Case A
$execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=..0,col_terrain=1..}] run function $(func_npe_end) {end_reason:20}
$execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=..0,col_terrain=0,col_entity=1..}] run function $(func_npe_end) {end_reason:30}
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=..0}] run tag @s add t_kill
execute if entity @s[tag=t_kill] run scoreboard players reset @s
kill @s[tag=t_kill]

# Case B
$execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..,col_terrain=1..},tag=t_missile_fall] run function $(func_npe_end) {end_reason:20}
$execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..,col_terrain=0,col_entity=1..},tag=t_missile_fall] run function $(func_npe_end) {end_reason:30}
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..},tag=t_missile_fall] run tag @s add t_kill
execute if entity @s[tag=t_kill] run scoreboard players reset @s
kill @s[tag=t_kill]

# Case C
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..},tag=!t_missile_fall] run tag @s add t_missile_fall
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..}] run scoreboard players set @s mis_base_vel_x_mmpt 0
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..}] run scoreboard players set @s[scores={mis_base_vel_y_mmpt=1..}] mis_base_vel_y_mmpt 0
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..}] run scoreboard players set @s[scores={mis_gravity_vel_y_mmpt=1..}] mis_gravity_vel_y_mmpt 0
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..}] run scoreboard players set @s mis_base_vel_z_mmpt 0
execute if entity @s[scores={__mis_has_collided=1,mis_gravity_const_mmpt2=1..}] run scoreboard players set @s __mis_has_collided 0

# util/pe_create_missile.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#	facing: entity's facing angle
#
# Summary: Generates a missile
#
# Arguments:
#	f_speed_mpt				: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection.
#							: 	If you change f_speed_mpt stored on the missile after creation, you must tag it as t_missile_calc_base_vel to update its speed
#	i_lifetime_ticks		: Missile i_lifetime_ticks, in ticks
#	i_range_m				: How far the missile is expected to travel, in meters. 
#							: 	Determines compensation angle to account for missile's origin being dislocated from the camera/perspective.
#	i_origin_loc			: Where the missile originates: 0 = aligned with camera, 1 = right-handed position, 2 = left-handed position
#	i_gravity_vy_mmpt		: Initial vertical gravitational velocity, in mm/tick
#	i_gravity_const_mmpt2	: Vertical velocity gained per tick, in mm/tick^2
#	f_tracking_scalar		: Scalar of strength of tracking towards potential targets
#							: 	If you change f_tracking_scalar stored on the missile after creation, you must tag it as 
#								t_missile_calc_tracking to recalculate some internal tracking parameters
#	t_missile_name			: Tag to issue to the missile on creation
#	col_terrain_allowed		: Block tag or block type that describes what counts as not solid collision
#	func_entity_filter		: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities to collide with
#	func_tracking_filter	: Similar to func_entity_filter, but used for determining targets to track towards
#	func_start				: Function to run as the missile on instantiation
#	func_step				: Function to run as the missile every tick
#	func_end				: Function to run as the missile when either the missile collides or expires
#								func_end is supplied with an end_reason argument based on why func_end was called: 0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired

summon minecraft:marker ~ ~ ~ {Tags:["t_missile_init"]}
$scoreboard players set @s temp_A $(i_origin_loc)
execute if entity @s[scores={temp_A=0}] positioned ~ ~1.5 ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ~ ~ ~ facing ^ ^ ^1
$execute if entity @s[scores={temp_A=1}] positioned ~ ~1.5 ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ^-0.20 ^-0.05 ^0.25 facing ^ ^ ^$(i_range_m)
$execute if entity @s[scores={temp_A=2}] positioned ~ ~1.5 ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ^0.20 ^-0.05 ^0.25 facing ^ ^ ^$(i_range_m)

$data merge entity @e[tag=t_missile_init,limit=1,sort=nearest] {data:{col_terrain_allowed:"$(col_terrain_allowed)",func_entity_filter:"$(func_entity_filter)",func_step:"$(func_step)",func_end:"$(func_end)",vel_x:0.0f,vel_y:0.0f,vel_z:0.0f,f_speed_mpt:$(f_speed_mpt)f,f_tracking_scalar:$(f_tracking_scalar),func_tracking_filter:"$(func_tracking_filter)",tracking_dyaw:0,tracking_dpitch:0}}

execute store result score @s temp_B run data get entity @e[tag=t_missile_init,limit=1,sort=nearest] data.f_tracking_scalar 1000000
execute if entity @s[scores={temp_B=1..}] run tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile_has_tracking
execute if entity @s[scores={temp_B=1..}] run tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile_calc_tracking

$execute as @e[tag=t_missile_init,limit=1,sort=nearest] at @s run function coinwars:base/pe_missile_calc_base_vel {f_speed_mpt:$(f_speed_mpt)f,tracking_dyaw:0,tracking_dpitch:0}
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_lifetime_ticks $(i_lifetime_ticks)
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_gravity_vel_y_mmpt $(i_gravity_vy_mmpt)
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_gravity_const_mmpt2 $(i_gravity_const_mmpt2)

scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_func_step_dyaw_mdeg 0
scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_func_step_dpitch_mdeg 0

tag @e[tag=t_missile_init,limit=1,sort=nearest,scores={mis_gravity_const_mmpt2=1..}] add t_missile_has_gravity
tag @e[tag=t_missile_init,limit=1,sort=nearest,scores={mis_gravity_const_mmpt2=..-1}] add t_missile_has_gravity

$tag @e[tag=t_missile_init,limit=1,sort=nearest] add $(t_missile_name)

execute as @e[tag=t_missile_init,limit=1,sort=nearest] at @s run function coinwars:util/pe_eid_acquire
scoreboard players operation @e[tag=t_missile_init,limit=1,sort=nearest] eid_owner = @s eid_self
scoreboard players operation @e[tag=t_missile_init,limit=1,sort=nearest] team_id = @s team_id

$execute as @e[tag=t_missile_init,limit=1,sort=nearest] at @s run function $(func_start)

#tellraw @a[tag=t_debug] [{"text":"util/pe_create_missile data = "},{"entity":"@e[tag=t_missile_init,limit=1,sort=nearest]","nbt":"data"}]
#tellraw @a[tag=t_debug] [{"text":"util/pe_create_missile tags = "},{"entity":"@e[tag=t_missile_init,limit=1,sort=nearest]","nbt":"Tags"}]

# Initialization complete
tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile
tag @e[tag=t_missile_init,limit=1,sort=nearest] remove t_missile_init

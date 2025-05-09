# util/npe_create_missile.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#
# Summary: Generates a missile
#
# Arguments:
#	f_speed_mpt					: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection.
#								: 	If you change f_speed_mpt stored on the missile after creation, you must tag it as t_missile_calc_base_vel to update its speed
#	i_lifetime_ticks			: Missile i_lifetime_ticks, in ticks
#	i_origin_loc				: Where the missile originates: 0 = aligned with camera, 1 = right-handed position, 2 = left-handed position
#	f_focal_dist_m				: When i_origin_loc is nonzero, the missile doesn't originate aligned with the camera despite that being where
#								: 	the player is aiming. To compensate for this, the missile is angled towards a position f_focal_dist_m meters
#								:	along the camera's facing vector. f_focal_dist_m is unused when i_origin_loc is 0
#	i_gravity_vy_mmpt			: Initial vertical gravitational velocity, in mm/tick
#	i_gravity_const_mmpt2		: Vertical velocity gained per tick, in mm/tick^2
#	f_tracking_scalar			: Scalar of strength of tracking towards potential targets
#								: 	If you change f_tracking_scalar stored on the missile after creation, you must tag it as 
#									t_missile_init_tracking to recalculate some internal tracking parameters
#	t_missile_name				: Tag to issue to the missile on creation
#	col_terrain_allowed			: Block tag or block type that describes what counts as not solid collision
#	func_npe_entity_filter		: Filtering function for which entities to collide with. Function applies the tag "t_collision_candidate" to all possible entities to collide with
#	func_npe_tracking_filter	: Similar to func_entity_filter, but used for determining targets to track towards
#	func_npe_start				: Function to run as the missile on instantiation
#	func_npe_tick				: Function to run as the missile every tick
#	func_npe_end				: Function to run as the missile when either the missile collides or expires
#									func_end is supplied with an end_reason argument based on why func_end was called
#                                   end_reason 0   = cleaned up
#                                   end_reason 1   = cleaned up from player death
#                                   end_reason 10  = missile lifetime expired
#                                   end_reason 20  = missile struck terrain
#                                   end_reason 30  = missile hit an entity
#	b_assign_as_peer			: Set to nonzero to assign eid_owner to missile to be a peer to the executor rather than owned by them. 
#									Useful for pms that call this function.

# Create missile marker
summon minecraft:marker ~ ~ ~ {Tags:["t_missile_init"]}
$scoreboard players set @s temp_A $(i_origin_loc)
execute if entity @s[scores={temp_A=0}] positioned ~ ~ ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ~ ~ ~ facing ^ ^ ^1
$execute if entity @s[scores={temp_A=1}] positioned ~ ~1.5 ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ^-0.20 ^-0.05 ^0.25 facing ^ ^ ^$(f_focal_dist_m)
$execute if entity @s[scores={temp_A=2}] positioned ~ ~1.5 ~ run tp @e[tag=t_missile_init,limit=1,sort=nearest] ^0.20 ^-0.05 ^0.25 facing ^ ^ ^$(f_focal_dist_m)

# Write data to missile from function parameters
$data merge entity @e[tag=t_missile_init,limit=1,sort=nearest] {data:{\
col_terrain_allowed:"$(col_terrain_allowed)",\
func_npe_entity_filter:"$(func_npe_entity_filter)",\
func_npe_tick:"$(func_npe_tick)",\
func_npe_end:"$(func_npe_end)",\
vel_x:0.0f,vel_y:0.0f,vel_z:0.0f,\
f_speed_mpt:$(f_speed_mpt)f,\
f_tracking_scalar:$(f_tracking_scalar)f,\
func_npe_tracking_filter:"$(func_npe_tracking_filter)",\
tracking_dyaw:0,tracking_dpitch:0}}

# If the missile has tracking (if f_tracking_scalar > 0), tag missile to apply tracking and calculate its parameters
execute store result score @s temp_B run data get entity @e[tag=t_missile_init,limit=1,sort=nearest] data.f_tracking_scalar 1000000
execute if entity @s[scores={temp_B=1..}] run tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile_has_tracking
execute if entity @s[scores={temp_B=1..}] run tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile_init_tracking
execute if entity @s[scores={temp_B=1..}] run scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_tracking_target_eid 0

# Schedule missile to calcualte its base velocity
tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile_calc_base_vel

# Write miscellaneous scoreboard data to missile
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_lifetime_ticks $(i_lifetime_ticks)
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] __mis_gravity_vel_y_mmpt $(i_gravity_vy_mmpt)
$scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] __mis_gravity_const_mmpt2 $(i_gravity_const_mmpt2)

scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_func_tick_dyaw_mdeg 0
scoreboard players set @e[tag=t_missile_init,limit=1,sort=nearest] mis_func_tick_dpitch_mdeg 0

$tag @e[tag=t_missile_init,limit=1,sort=nearest] add $(t_missile_name)

# If the missile has gravity (if i_gravity_const_mmpt2 > 0), tag missile to apply tracking and calculate its parameters
tag @e[tag=t_missile_init,limit=1,sort=nearest,scores={__mis_gravity_const_mmpt2=1..}] add t_missile_has_gravity

# Issue EID to missile
execute as @e[tag=t_missile_init,limit=1,sort=nearest] at @s run function cashgrab:util/npe_eid_acquire
$execute if score NUM_ZERO num matches $(b_assign_as_peer) run scoreboard players operation @n[type=minecraft:marker,tag=t_missile_init] eid_owner = @s eid_self
$execute unless score NUM_ZERO num matches $(b_assign_as_peer) run scoreboard players operation @n[type=minecraft:marker,tag=t_missile_init] eid_owner = @s eid_owner
scoreboard players operation @e[tag=t_missile_init,limit=1,sort=nearest] team_id = @s team_id

# Run func_npe_start
$execute as @e[tag=t_missile_init,limit=1,sort=nearest] at @s run function $(func_npe_start)

#tellraw @a[tag=t_debug] [{"text":"util/pe_create_missile data = "},{"entity":"@e[tag=t_missile_init,limit=1,sort=nearest]","nbt":"data"}]
#tellraw @a[tag=t_debug] [{"text":"util/pe_create_missile tags = "},{"entity":"@e[tag=t_missile_init,limit=1,sort=nearest]","nbt":"Tags"}]

# Initialization complete
tag @e[tag=t_missile_init,limit=1,sort=nearest] add t_missile
tag @e[tag=t_missile_init,limit=1,sort=nearest] remove t_missile_init

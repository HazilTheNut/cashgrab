# base/pe_operate_missile.mcfunction
#
# Context:
#	as: a missile that has the following scoreboard values defined:
#		col_terrain		: Terrain collision rules value. Possible values:
#			0 = No collision with terrain
#			1 = Passes through #coinwars:nonsolid
#			2 = Passes through #coinwars:open		
#		col_entity		: Entity collision rules value. Possible values:
#			0 = No collision with entities
#			1 = Collides with enemy entities
#			2 = Collides with ally entities
#			3 = Collides with all entities with tag "pvp"
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: test class b's missile end function
#
# Arguments:
#	speed			: Missile travel speed, in meters/tick. Velocities faster than 1 will have less accurate hit detection
#	gravity_vy_m	: Missile vertical velocity from gravity, in meters/tick.
#	func_step		: String function name to run every tick
#	func_end		: String function name to run when either the missile collides or expires

# Decrement lifetime and run func_step or func_end
scoreboard players remove @s mis_lifetime 1
$execute if entity @s[scores={mis_lifetime=1..}] run function $(func_step)
$execute if entity @s[scores={mis_lifetime=0}] run function $(func_end)
execute if entity @s[scores={mis_lifetime=0}] run kill @s

# func_step can run commands like tp to alter its location and facing angle and should therefore influence where it goes
# Thus func_step is ran first before generic missile movement

# Run collision detection on the next position
$execute if entity @s[tag=!t_missile_fall] positioned ~ ~$(gravity_vy_m) ~ positioned ^ ^ ^$(speed) run function coinwars:util/pe_detect_collision
$execute if entity @s[tag=t_missile_fall] positioned ~ ~-$(speed) ~ run function coinwars:util/pe_detect_collision

# If no collision, travel forwards
$execute if entity @s[tag=!t_missile_fall,scores={has_collided=0}] positioned ~ ~$(gravity_vy_m) ~ run tp @s ^ ^ ^$(speed)
$execute if entity @s[tag=t_missile_fall] run tp @s ~ ~-$(speed) ~

# If there is a collision, do one of three things:
# 	A) If the missile has no gravity, run func_end and then destroy itself
# 	B) If the missile has gravity and has the t_missile_fall tag, run func_end and then destroy itself
# 	C) If the missile has gravity and does not have the t_missile_fall tag, apply t_missile_fall tag

# Case A
$execute if entity @s[scores={has_collided=1,mis_gravity_const=0}] run function $(func_end)
execute if entity @s[scores={has_collided=1,mis_gravity_const=0}] run kill @s

# Case B
$execute if entity @s[scores={has_collided=1,mis_gravity_const=1..},tag=t_missile_fall] run function $(func_end)
execute if entity @s[scores={has_collided=1,mis_gravity_const=1..},tag=t_missile_fall] run kill @s

# Case C
execute if entity @s[scores={has_collided=1,mis_gravity_const=1..},tag=!t_missile_fall] run tag @s add t_missile_fall
execute if entity @s[scores={has_collided=1,mis_gravity_const=1..}] run scoreboard players set @s has_collided 0
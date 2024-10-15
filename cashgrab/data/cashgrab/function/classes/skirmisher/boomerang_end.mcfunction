# classes/skirmisher/boomerang_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Skirmsher's Boomerang end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	If 1, refresh inventory
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# Desstroy item display
function cashgrab:util/npe_eid_find_subs
tag @e[scores={eid_compare=0}] add t_kill
scoreboard players reset @e[tag=t_kill]
kill @e[tag=t_kill]

$scoreboard players set @s temp_A $(end_reason)

# Create breakage particles on impact with terrain
execute if score @s temp_A matches 1 if score @s cv_E matches 1 run particle minecraft:item{item:"minecraft:iron_sword"} ~ ~ ~ 0.5 0.25 0.5 0.1 30
execute if score @s temp_A matches 1 if score @s cv_E matches 2 run particle minecraft:item{item:"minecraft:golden_sword"} ~ ~ ~ 0.5 0.25 0.5 0.1 30
execute if score @s temp_A matches 1 run playsound minecraft:entity.item.break player @a ~ ~ ~ 1.0 1.0
execute if score @s temp_A matches 1 run return 0

execute if score @s temp_A matches 0 run return 0
execute if score @s temp_A matches 3 run return 0

# Below executes when end_reason = 2, when we hit an entity (the player who threw the boomerang)

playsound minecraft:entity.breeze.jump player @a ~ ~ ~ 1.0 0.25

scoreboard players set @e[tag=t_collision_found,limit=1,sort=nearest,scores={ability_cd_ticks=2..100}] ability_cd_ticks 1
scoreboard players remove @e[tag=t_collision_found,limit=1,sort=nearest,scores={ability_cd_ticks=101..}] ability_cd_ticks 100
scoreboard players set @e[tag=t_collision_found,limit=1,sort=nearest] cv_B 0

# Refresh inventory
scoreboard players set @e[tag=t_collision_found,limit=1,sort=nearest] cv_C 1

effect give @e[tag=t_collision_found,limit=1,sort=nearest] minecraft:speed 3 1

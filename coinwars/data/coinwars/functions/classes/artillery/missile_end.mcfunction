# classes/artillery/missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: test class b's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

execute if score @s temp_A matches 0 run return 0
execute if score @s temp_A matches 3 run return 0

particle minecraft:explosion ~ ~ ~ 1.5 1 1.5 0 15 force
particle minecraft:lava ~ ~ ~ 2 0.2 2 0 10 force
particle minecraft:flame ~ ~ ~ 2 0.2 2 0 10 force
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.9

function coinwars:util/pe_col_filter_entity_hostile
function coinwars:util/pe_eid_find_owner
tag @e[scores={eid_compare=0}] add t_dmg_src
tag @s add t_dmg_loc
execute as @e[tag=t_collision_candidate,distance=..4] run damage @s 6.0 minecraft:fireball by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_dmg_loc,limit=1,sort=nearest]
tag @e[scores={eid_compare=0}] remove t_dmg_src
tag @s remove t_dmg_loc

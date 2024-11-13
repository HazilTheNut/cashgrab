# classes/artillery/missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Artillery's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Power Shot charge
#	cv_F	:	Power Shot cooldown, in ms
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

execute if score @s temp_A matches 0 run return 0
execute if score @s temp_A matches 3 run return 0

particle minecraft:explosion ~ ~ ~ 1.5 1 1.5 0 15 force
particle minecraft:lava ~ ~ ~ 2 0.2 2 0 10 force
particle minecraft:flame ~ ~ ~ 2 0.2 2 0 10 force
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.9

# Tag owner with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Tag relevant entities
tag @s add t_dmg_by
tag @a[tag=t_eid_matches,limit=1] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..4] add t_dmg_trgt

# Apply damage
function cashgrab:util/npe_dmg {\
d_dmg_amount:6.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1}

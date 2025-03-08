# classes/evincer/cerulean_sphere_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Evincer's Cerulean Sphere missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

# sfx / vfx
particle minecraft:bubble_pop ~ ~ ~ 0.3 0.6 0.3 0 20 normal
particle minecraft:splash ~ ~ ~ 0.3 0.6 0.3 0.1 20 normal
particle minecraft:dust{color:[0.00,0.70,1.00],scale:2.0} ~ ~ ~ 0.5 0.8 0.5 0.2 20 force
playsound minecraft:entity.dolphin.splash player @a ~ ~ ~ 1.0 2.0

$tellraw @a[tag=t_debug] "classes/evincer/cerulean_sphere_missile_end end_reason $(end_reason)"
$execute unless score NUM_END_REASON_ENTITY_COLLISION num matches $(end_reason) run return 0

# Apply damage and slowness to enemy hit
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches] add t_dmg_from
tag @s add t_dmg_by
tag @e[tag=t_collision_found] add t_dmg_trgt

effect give @e[tag=t_collision_found] minecraft:slowness 3 2
function cashgrab:util/npe_dmg {\
d_dmg_amount:5.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# classes/evincer/pearlescent_wave_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Evincer's Pearlescent Wave missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

particle minecraft:dust_color_transition{from_color:[1.00,0.85,0.95],to_color:[0.95,1.00,0.85],scale:1.5} ~ ~ ~ 0.3 0.02 0.3 0 2 force

execute if score @s stasis_state matches 1..2 run return 0

# Apply damage around it
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches] add t_dmg_from
tag @s add t_dmg_by
function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-1 ~-2 ~-1 run tag @e[dx=2,dy=3,dz=2,tag=t_collision_candidate] add t_dmg_trgt

function cashgrab:util/npe_dmg {\
d_dmg_amount:4.5,\
s_dmg_type:"minecraft:indirect_magic",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

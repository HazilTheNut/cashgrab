# classes/evincer/pmtl_ochre_laser_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the raycast step position
#	rotated: as the owner
#
# Summary: Evincer's Ochre Laser end function
#
# Arguments:
#   end_reason  :   The reason why the raycast ended

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

$execute unless score NUM_END_REASON_ENTITY_COLLISION num matches $(end_reason) run return 0
# Apply damage and glowing to enemy hit
tag @a[tag=t_pm_owner] add t_dmg_from
tag @a[tag=t_pm_owner] add t_dmg_by
tag @e[tag=t_collision_found] add t_dmg_trgt

effect give @e[tag=t_collision_found] minecraft:glowing 5 0
function cashgrab:util/npe_dmg {\
d_dmg_amount:3.0,\
s_dmg_type:"cashgrab:light_attack",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}


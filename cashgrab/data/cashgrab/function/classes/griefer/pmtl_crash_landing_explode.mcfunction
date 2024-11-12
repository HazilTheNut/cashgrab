# classes/griefer/pmtl_crash_landing_explode.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Creates explosion for Crash Landing ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown (in ms)
#	cv_D	:	Creeper in a Bottle charge
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

# vfx / sfx

particle minecraft:explosion ~ ~0.65 ~ 2.75 0.2 2.75 0 20 force
particle minecraft:lava ~ ~0.65 ~ 2.75 0.2 2.75 0 15
particle minecraft:flame ~ ~0.65 ~ 2.75 0.2 2.75 0 15 force
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.75

# Apply damage
tag @a[tag=t_pm_owner] add t_dmg_by
tag @a[tag=t_pm_owner] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..5.5] add t_dmg_trgt
function cashgrab:util/npe_dmg {\
d_dmg_amount:8.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# Exit Crash Landing state
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0

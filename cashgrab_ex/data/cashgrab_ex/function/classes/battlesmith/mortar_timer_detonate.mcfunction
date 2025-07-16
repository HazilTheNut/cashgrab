# classes/battlesmith/mortar_timer_detonate.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Battlesmith's Molten Mortar timer detonation effect
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

# sfx / vfx
particle minecraft:lava ~ ~1 ~ 0.55 0.5 0.55 0 10
particle minecraft:flame ~ ~2 ~ 0.45 1 0.45 0.05 20
playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 1.0 1.5

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Tag entities for applying damage
tag @s add t_dmg_by
tag @a[tag=t_eid_matches] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-2 ~-2 ~-2 run tag @e[tag=t_collision_candidate,dx=4,dy=7,dz=4] add t_dmg_trgt

# If any damage dealt, award scrap
execute if entity @e[tag=t_dmg_trgt,distance=..10] run tag @a[tag=t_dmg_from,limit=1,scores={cv_A=..19}] add t_award_scrap

# Apply damage
function cashgrab:util/npe_dmg {\
d_dmg_amount:3.5,\
s_dmg_type:"cashgrab:fire_volume",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}


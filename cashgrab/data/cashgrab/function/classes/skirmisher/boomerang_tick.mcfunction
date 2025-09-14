# classes/skirmisher/boomerang_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Skirmsher's Boomerang tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# If in stasis, do not animate, play sfx, or do hit detection
execute if score @s stasis_state matches 1..2 run return 0

scoreboard players add @s cv_H 1
tag @s[scores={cv_E=1,cv_H=50}] add t_boomerang_returning
tag @s[scores={cv_E=1,cv_H=50}] add t_boomerang_begin_return
tag @s[scores={cv_E=2,cv_H=35}] add t_boomerang_returning
tag @s[scores={cv_E=2,cv_H=35}] add t_boomerang_begin_return

# Find owner and tag them with t_boomerang_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_boomerang_owner

scoreboard players add @s cv_F 1
scoreboard players set @s[scores={cv_F=4..}] cv_F 0
execute if entity @s[tag=!t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.35 0.15 0.35 0 1
execute if entity @s[tag=t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.1 0.1 0.1 0 1
execute if entity @s[scores={cv_F=0},tag=!t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 0.85
execute if entity @s[tag=t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.1 0.1 0.1 0 1
execute if entity @s[scores={cv_F=0},tag=t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 1.25
execute if entity @s[scores={cv_F=2},tag=t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 1.25

#tellraw @a[tag=t_debug] [{text:"classes/skirmisher/boomerang_tick data = "},{"type":"nbt","entity":"@s","nbt":"data"}]
#tellraw @a[tag=t_debug] [{text:"classes/skirmisher/boomerang_tick tags = "},{"type":"nbt","entity":"@s","nbt":"Tags"}]

# Slowing down of boomerang
execute if entity @s[scores={cv_H=10..},tag=!t_boomerang_returning] store result entity @s data.f_speed_mpt float 0.00055 run data get entity @s data.f_speed_mpt 1000
execute if entity @s[scores={cv_H=10..},tag=!t_boomerang_returning] run tag @s add t_missile_calc_base_vel

# Reorient boomerang and track onto owner
execute if entity @s[tag=t_boomerang_begin_return] run data merge entity @s \
{data:{f_speed_mpt:0.75f,func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_owner",f_tracking_scalar:1.0f,func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_owner"}}
execute if entity @s[tag=t_boomerang_begin_return] facing entity @a[tag=t_eid_matches,limit=1] eyes run function cashgrab:util/npe_calc_facing_vector {magnitude:1.0f}
# Direction towards owner now stored on facing_vector_yaw_mdeg and facing_vector_pitch_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_tick_dyaw_mdeg = @s facing_vector_yaw_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_tick_dpitch_mdeg = @s facing_vector_pitch_mdeg
# Store my own rotation onto facing_vector_yaw_mdeg and facing_vector_pitch_mdeg
execute if entity @s[tag=t_boomerang_begin_return] store result score @s facing_vector_yaw_mdeg run data get entity @s Rotation[0] 1000
execute if entity @s[tag=t_boomerang_begin_return] store result score @s facing_vector_pitch_mdeg run data get entity @s Rotation[1] 1000
# Correction angle to point towards owner = direction towards owner - my orientation
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_tick_dyaw_mdeg -= @s facing_vector_yaw_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_tick_dpitch_mdeg -= @s facing_vector_pitch_mdeg
# Set boomerang tracking target to owner
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_tracking_target_eid = @s eid_owner

# On starting return, enable tracking and recalculate
tag @s[tag=t_boomerang_begin_return] add t_missile_has_tracking
tag @s[tag=t_boomerang_begin_return] add t_missile_init_tracking
tag @s remove t_boomerang_begin_return

# --- Damage enemies that collide with boomerang
function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-1.25 ~-1.5 ~-1.25 run tag @e[tag=t_collision_candidate,dx=1.5,dy=2,dz=1.5] add t_dmg_trgt
tag @s add t_dmg_by
tag @a[tag=t_boomerang_owner] add t_dmg_from

# Load args based on weapon type
execute if score @s cv_E matches 1 run data merge storage cashgrab:boomerang_dmg_args \
{d_dmg_amount:6.0,s_dmg_type:"minecraft:player_attack",t_dmg_target:"t_dmg_trgt",t_dmg_by:"t_dmg_by",t_dmg_from:"t_dmg_from",b_remove_tags:1}
execute if score @s cv_E matches 2 run data merge storage cashgrab:boomerang_dmg_args \
{d_dmg_amount:4.0,s_dmg_type:"minecraft:player_attack",t_dmg_target:"t_dmg_trgt",t_dmg_by:"t_dmg_by",t_dmg_from:"t_dmg_from",b_remove_tags:1}

function cashgrab:util/npe_dmg with storage cashgrab:boomerang_dmg_args

# t_boomerang_owner no longer in use
tag @a[tag=t_boomerang_owner] remove t_boomerang_owner

# --- Make the item display spin
function cashgrab:util/npe_eid_find_subs
scoreboard players add @e[scores={eid_compare=0}] cv_G 57
scoreboard players remove @e[scores={eid_compare=0,cv_G=360..}] cv_G 360
execute as @e[scores={eid_compare=0}] store result entity @s Rotation[0] float 1 run scoreboard players get @s cv_G
execute if block ~ ~-0.3 ~ #cashgrab:partialsolid run tp @e[scores={eid_compare=0}] ~ ~-0.3 ~
execute unless block ~ ~-0.3 ~ #cashgrab:partialsolid run tp @e[scores={eid_compare=0}] ~ ~ ~

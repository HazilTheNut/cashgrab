# classes/skirmisher/boomerang_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Skirmsher's Boomerang step function
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

scoreboard players add @s cv_H 1
tag @s[scores={cv_E=1,cv_H=70}] add t_boomerang_returning
tag @s[scores={cv_E=1,cv_H=70}] add t_boomerang_begin_return
tag @s[scores={cv_E=2,cv_H=40}] add t_boomerang_returning
tag @s[scores={cv_E=2,cv_H=40}] add t_boomerang_begin_return

function coinwars:util/pe_eid_find_owner

scoreboard players add @s cv_F 1
scoreboard players set @s[scores={cv_F=4..}] cv_F 0
execute if entity @s[tag=!t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.35 0.15 0.35 0 1
execute if entity @s[tag=t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.1 0.1 0.1 0 1
execute if entity @s[scores={cv_F=0},tag=!t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 0.85
execute if entity @s[tag=t_boomerang_returning] run particle end_rod ~ ~-0.5 ~ 0.1 0.1 0.1 0 1
execute if entity @s[scores={cv_F=0},tag=t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 1.25
execute if entity @s[scores={cv_F=2},tag=t_boomerang_returning] run playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.5 1.25

#tellraw @a[tag=t_debug] [{"text":"classes/skirmisher/boomerang_step data = "},{"type":"nbt","entity":"@s","nbt":"data"}]
#tellraw @a[tag=t_debug] [{"text":"classes/skirmisher/boomerang_step tags = "},{"type":"nbt","entity":"@s","nbt":"Tags"}]

# Slowing down of boomerang
execute if entity @s[scores={cv_H=12..},tag=!t_boomerang_returning] store result entity @s data.f_speed_mpt float 0.0008 run data get entity @s data.f_speed_mpt 1000
execute if entity @s[scores={cv_H=12..},tag=!t_boomerang_returning] run tag @s add t_missile_calc_base_vel

# Reorient boomerang and track onto owner
execute if entity @s[tag=t_boomerang_begin_return] run data merge entity @s \
{data:{f_speed_mpt:0.75f,func_entity_filter:"coinwars:util/pe_col_entity_filter_owner",f_tracking_scalar:0.95f,func_tracking_filter:"coinwars:util/pe_col_entity_filter_owner"}}
execute if entity @s[tag=t_boomerang_begin_return] facing entity @e[scores={eid_compare=0}] eyes run function coinwars:util/pe_calc_facing_vector {magnitude:1.0f}
# Direction towards owner now stored on facing_vector_yaw_mdeg and facing_vector_pitch_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_step_dyaw_mdeg = @s facing_vector_yaw_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_step_dpitch_mdeg = @s facing_vector_pitch_mdeg
# Store my own rotation onto facing_vector_yaw_mdeg and facing_vector_pitch_mdeg
execute if entity @s[tag=t_boomerang_begin_return] store result score @s facing_vector_yaw_mdeg run data get entity @s Rotation[0] 1000
execute if entity @s[tag=t_boomerang_begin_return] store result score @s facing_vector_pitch_mdeg run data get entity @s Rotation[1] 1000
# Correction angle to point towards owner = direction towards owner - my orientation
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_step_dyaw_mdeg -= @s facing_vector_yaw_mdeg
execute if entity @s[tag=t_boomerang_begin_return] run scoreboard players operation @s mis_func_step_dpitch_mdeg -= @s facing_vector_pitch_mdeg

tag @s[tag=t_boomerang_begin_return] add t_missile_has_tracking
tag @s[tag=t_boomerang_begin_return] add t_missile_calc_tracking
tag @s remove t_boomerang_begin_return

# Damage enemies nearby
execute store result score @s temp_A run function coinwars:util/pe_col_detect_entity {func_entity_filter:"coinwars:util/pe_col_entity_filter_hostile"}
execute if score @s temp_A matches 1 run tag @s add t_dmg_src
execute if score @s temp_A matches 1 if score @s cv_E matches 1 as @e[tag=t_collision_found] run damage @s 6.0 minecraft:player_attack by @e[scores={eid_compare=0},limit=1] from @e[tag=t_dmg_src,limit=1]
execute if score @s temp_A matches 1 if score @s cv_E matches 2 as @e[tag=t_collision_found] run damage @s 4.0 minecraft:player_attack by @e[scores={eid_compare=0},limit=1] from @e[tag=t_dmg_src,limit=1]
execute if score @s temp_A matches 1 run tag @s remove t_dmg_src
tag @e remove t_collision_found

# Make the item display spin
function coinwars:util/pe_eid_find_subs
scoreboard players add @e[scores={eid_compare=0}] cv_G 57
scoreboard players remove @e[scores={eid_compare=0,cv_G=360..}] cv_G 360
execute as @e[scores={eid_compare=0}] store result entity @s Rotation[0] float 1 run scoreboard players get @s cv_G
execute if block ~ ~-0.3 ~ #coinwars:partialsolid run tp @e[scores={eid_compare=0}] ~ ~-0.3 ~
execute unless block ~ ~-0.3 ~ #coinwars:partialsolid run tp @e[scores={eid_compare=0}] ~ ~ ~

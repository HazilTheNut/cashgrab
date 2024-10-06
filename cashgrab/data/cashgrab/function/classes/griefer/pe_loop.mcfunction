# classes/griefer/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: the entity
#
# Summary: Loop function for Griefer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer

# When on the ground, calculate the Crash Landing cutoff height
execute if score @s ps_falling matches ..0 store result score @s cv_G run data get entity @s Pos[1] 1000
execute if score @s ps_falling matches ..0 run scoreboard players add @s cv_G 2380

# Tick down Crash Landing timer
scoreboard players remove @s[scores={cv_B=0..}] cv_B 1

# If during a Crash Landing, check if my Y position exceeded the cutoff
execute if entity @s[scores={cv_A=1,cv_B=1..}] store result score @s cv_F run data get entity @s Pos[1] 1000
execute if entity @s[scores={cv_A=1,cv_B=1..}] if score @s cv_F < @s cv_G run tellraw @s[tag=t_debug] [{"text":"Lift frame "},{"score":{"name":"@s","objective":"cv_F"}},{"text":" vs "},{"score":{"name":"@s","objective":"cv_G"}}]
execute if entity @s[scores={cv_A=1,cv_B=1..}] if score @s cv_F >= @s cv_G run tellraw @s[tag=t_debug] [{"text":"Lift cutoff ","color":"red"},{"score":{"name":"@s","objective":"cv_F"}},{"text":" vs "},{"score":{"name":"@s","objective":"cv_G"}}]
execute if entity @s[scores={cv_A=1,cv_B=1..}] if score @s cv_F >= @s cv_G run scoreboard players set @s cv_B 0

# End levitation effect when timer is ending
effect clear @s[scores={cv_B=0}] minecraft:levitation

# Crash Landing flight particles
execute if entity @s[scores={cv_A=1}] run particle minecraft:flame ~ ~0.35 ~ 0.1 0.2 0.1 0 2

# Crash Landing Landing
tag @s[scores={ps_falling=-1,cv_A=1..,cv_B=..0}] add t_crash_landing_explode
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:explosion ~ ~0.65 ~ 2.5 0.2 2.5 0 20 force
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:lava ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_crash_landing_explode] run particle minecraft:flame ~ ~0.65 ~ 2.5 0.2 2.5 0 15 force
execute if entity @s[tag=t_crash_landing_explode] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.75

execute if entity @s[tag=t_crash_landing_explode] run function coinwars:util/pe_col_entity_filter_hostile
execute if entity @s[tag=t_crash_landing_explode] run tag @s add t_dmg_src
execute if entity @s[tag=t_crash_landing_explode] as @e[tag=t_collision_candidate,distance=..4.5] run damage @s 6.0 minecraft:fireball by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_dmg_src,limit=1,sort=nearest]

scoreboard players set @s[tag=t_crash_landing_explode] cv_A 0
tag @s remove t_dmg_src
tag @s remove t_crash_landing_explode

# Creeper in a Bottle
execute if score @s ev_xpbottles matches 1.. run function coinwars:util/pe_raycast {\
i_range_m:3,\
i_origin_loc:0,\
col_terrain_allowed:"#coinwars:nonsolid",\
b_fit_player:1,\
func_entity_filter:"coinwars:util/pe_col_entity_filter_none",\
func_step:"coinwars:util/dummy",\
func_end:"coinwars:classes/griefer/summon_creeper",\
}
execute if score @s ev_xpbottles matches 1.. run scoreboard players set @s cv_C 160
execute if score @s ev_xpbottles matches 1.. run function coinwars:classes/griefer/creeper_ability_icon

# Creeper in a Bottle cooldown
scoreboard players remove @s[scores={cv_C=0..}] cv_C 1
execute if score @s cv_C matches 0 run function coinwars:classes/griefer/creeper_ability_icon

# Run func_step for creepers generated
function coinwars:util/pe_eid_find_subs
execute as @e[type=minecraft:creeper,tag=t_griefer_creeper,scores={eid_compare=0}] at @s run function coinwars:classes/griefer/creeper_func_step
execute as @e[type=minecraft:creeper,tag=t_griefer_creeper_stasis,scores={eid_compare=0}] at @s run function coinwars:classes/griefer/creeper_stasis_func_step

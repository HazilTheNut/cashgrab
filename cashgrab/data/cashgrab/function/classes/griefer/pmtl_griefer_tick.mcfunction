# classes/griefer/pmtl_griefer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Griefer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown (in ms)
#	cv_D	:	Creeper in a Bottle charge
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer

# --- Crash Landing

# When on the ground, calculate the Crash Landing cutoff height
execute if score @a[tag=t_pm_owner,limit=1] ps_falling matches ..0 store result score @a[tag=t_pm_owner,limit=1] cv_G run data get entity @a[tag=t_pm_owner,limit=1] Pos[1] 1000
execute if score @a[tag=t_pm_owner,limit=1] ps_falling matches ..0 run scoreboard players add @a[tag=t_pm_owner,limit=1] cv_G 2380

# Tick down Crash Landing timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_B=0..}] cv_B 1

# If during a Crash Landing, check if my Y position exceeded the cutoff
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=1..}] store result score @a[tag=t_pm_owner,limit=1] cv_F run data get entity @a[tag=t_pm_owner,limit=1] Pos[1] 1000
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=1..}] if score @a[tag=t_pm_owner,limit=1] cv_F < @a[tag=t_pm_owner,limit=1] cv_G run tellraw @a[tag=t_pm_owner,tag=t_debug] [{"text":"Lift frame "},{"score":{"name":"@a[tag=t_pm_owner]","objective":"cv_F"}},{"text":" vs "},{"score":{"name":"@a[tag=t_pm_owner]","objective":"cv_G"}}]
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=1..}] if score @a[tag=t_pm_owner,limit=1] cv_F >= @a[tag=t_pm_owner,limit=1] cv_G run tellraw @a[tag=t_pm_owner,tag=t_debug] [{"text":"Lift cutoff ","color":"red"},{"score":{"name":"@a[tag=t_pm_owner]","objective":"cv_F"}},{"text":" vs "},{"score":{"name":"@a[tag=t_pm_owner]","objective":"cv_G"}}]
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=1..}] if score @a[tag=t_pm_owner,limit=1] cv_F >= @a[tag=t_pm_owner,limit=1] cv_G run scoreboard players set @a[tag=t_pm_owner] cv_B 0

# End levitation effect when timer is ending
effect clear @a[tag=t_pm_owner,limit=1,scores={cv_B=0}] minecraft:levitation

# Crash Landing flight particles
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] run particle minecraft:flame ~ ~0.35 ~ 0.1 0.2 0.1 0 2

# Crash Landing Landing
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_falling=-1,cv_A=1..,cv_B=..0}] run function cashgrab:classes/griefer/pmtl_crash_landing_explode

# --- Creeper in a Bottle

# Creeper in a Bottle
execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:3,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab:classes/griefer/pmtl_summon_creeper",\
}
execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 8000
execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_D 0
execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. run function cashgrab:classes/griefer/pmt_inv_creeper_ability_icon

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_xpbottles 0

# Creeper in a Bottle cooldown
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={cv_C=1..}] cv_C -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate
tag @a[tag=t_pm_owner,limit=1,scores={cv_C=..0,cv_D=0}] add t_award_creeper_bottle
scoreboard players set @a[tag=t_pm_owner,limit=1,tag=t_award_creeper_bottle] cv_D 1
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_creeper_bottle] run function cashgrab:classes/griefer/pmt_inv_creeper_ability_icon
tag @a[tag=t_pm_owner,limit=1] remove t_award_creeper_bottle

# Run func_tick for creepers generated

# Find subordinates of player
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
#tellraw @a[tag=t_debug,scores={class=1,cv_C=1..}] [{"text":"pmtl_griefer_loop: pm eid_owner: "},{"score":{"name":"@s","objective":"eid_owner"}}]
function cashgrab:util/find_eid_owned_by with storage cashgrab:find_eid_args

execute as @e[type=minecraft:creeper,tag=t_griefer_creeper,tag=t_eid_matches] at @s run function cashgrab:classes/griefer/creeper_func_tick
execute as @e[type=minecraft:creeper,tag=t_griefer_creeper_stasis,tag=t_eid_matches] at @s run function cashgrab:classes/griefer/creeper_stasis_func_tick

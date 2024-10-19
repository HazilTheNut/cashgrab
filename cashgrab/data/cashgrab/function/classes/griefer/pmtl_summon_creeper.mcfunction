# classes/griefer/pmtl_summon_creeper.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Summons Griefer class creeper
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

execute align y positioned ~ ~0.25 ~ run summon minecraft:creeper ~ ~ ~ {Tags:["t_griefer_creeper_init"],Fuse:6000,ignited:1b}
scoreboard players set @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] cv_H 30
execute as @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] run function cashgrab:util/npe_eid_acquire
scoreboard players operation @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_owner = @a[tag=t_pm_owner,limit=1] eid_self
scoreboard players set @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_state 2
tag @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] add t_griefer_creeper
tag @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] remove t_griefer_creeper_init

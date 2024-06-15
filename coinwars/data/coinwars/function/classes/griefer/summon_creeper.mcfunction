# classes/griefer/summon_creeper.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: location to summon creeper
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
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

execute align y positioned ~ ~0.25 ~ run summon minecraft:creeper ~ ~ ~ {Tags:["t_griefer_creeper_init"],Fuse:1000,ignited:1b}
scoreboard players set @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] cv_H 30
execute as @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] run function coinwars:util/pe_eid_acquire
scoreboard players operation @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_owner = @s eid_self
tag @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] add t_griefer_creeper
tag @e[type=minecraft:creeper,tag=t_griefer_creeper_init,limit=1,sort=nearest] remove t_griefer_creeper_init

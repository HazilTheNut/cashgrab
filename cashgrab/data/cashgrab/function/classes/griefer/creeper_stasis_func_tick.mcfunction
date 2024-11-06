# classes/griefer/creeper_stasis_func_tick.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: the entity
#
# Summary: Tick function for stasis fake copy version Griefer creeper
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

execute if score @s stasis_state matches -1 run tag @s add t_cleanup
execute if score @s stasis_state matches -1 run summon minecraft:creeper ~ ~ ~ {Tags:["t_griefer_creeper_init"],Fuse:1000,ignited:1b}
execute if score @s stasis_state matches -1 run scoreboard players set @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_state 2
execute if score @s stasis_state matches -1 run scoreboard players operation @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] cv_H = @s cv_H
execute if score @s stasis_state matches -1 run scoreboard players operation @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_self = @s eid_self
execute if score @s stasis_state matches -1 run scoreboard players operation @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] eid_owner = @s eid_owner
execute if score @s stasis_state matches -1 run scoreboard players set @s eid_self 0
execute if score @s stasis_state matches -1 run scoreboard players set @s eid_state 0
execute if score @s stasis_state matches -1 run tag @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] add t_griefer_creeper
execute if score @s stasis_state matches -1 run tag @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] add t_no_self_cleanup
execute if score @s stasis_state matches -1 run tag @e[tag=t_griefer_creeper_init,limit=1,sort=nearest] remove t_griefer_creeper_init

execute if entity @s[tag=t_cleanup] run tp @s ~ ~-10000 ~
execute if entity @s[tag=t_cleanup] run scoreboard players reset @s
execute if entity @s[tag=t_cleanup] run kill @s
execute if entity @s[tag=t_cleanup] run return 0

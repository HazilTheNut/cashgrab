# classes/griefer/creeper_func_tick.mcfunction
#
# Context:
#	as: a Griefer creeper
#	at: the entity
#
# Summary: Tick function for Griefer creeper
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

# If stasis is applied to this creeper, due to inner Minecraft game logic, this creeper
#	needs to be destroyed and replaced with a dummy copy since I cannot reset the fuse
#	once lit
execute if score @s stasis_state matches 2 run tag @s add t_cleanup
execute if score @s stasis_state matches 2 run summon minecraft:creeper ~ ~ ~ {NoAI:1b,NoGravity:1b,Tags:["t_griefer_creeper_stasis_init"]}
execute if score @s stasis_state matches 2 run scoreboard players set @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] eid_state 2
execute if score @s stasis_state matches 2 run scoreboard players operation @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] cv_H = @s cv_H
execute if score @s stasis_state matches 2 run scoreboard players operation @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] eid_self = @s eid_self
execute if score @s stasis_state matches 2 run scoreboard players operation @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] eid_owner = @s eid_owner
execute if score @s stasis_state matches 2 run scoreboard players set @s eid_self 0
execute if score @s stasis_state matches 2 run scoreboard players set @s eid_state 0
execute if score @s stasis_state matches 2 run tag @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] add t_griefer_creeper_stasis
execute if score @s stasis_state matches 2 run tag @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] add t_no_self_cleanup
execute if score @s stasis_state matches 2 run tag @e[tag=t_griefer_creeper_stasis_init,limit=1,sort=nearest] remove t_griefer_creeper_stasis_init

execute if entity @s[tag=t_cleanup] run tp @s ~ ~-10000 ~
execute if entity @s[tag=t_cleanup] run scoreboard players reset @s
execute if entity @s[tag=t_cleanup] run kill @s
execute if entity @s[tag=t_cleanup] run return 0

scoreboard players remove @s cv_H 1

execute if score @s cv_H matches 1.. run return 0

# -- Explode

# vfx / sfx
particle minecraft:explosion ~ ~0.65 ~ 2.75 0.2 2.75 0 20 force
particle minecraft:lava ~ ~0.65 ~ 2.75 0.2 2.75 0 15
particle minecraft:flame ~ ~0.65 ~ 2.75 0.2 2.75 0 15 force
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 3.0 0.75

# Tag owner with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches] add t_creeper_owner

# Apply damage to others
tag @a[tag=t_creeper_owner] add t_dmg_from
tag @s add t_dmg_by
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..5.5] add t_dmg_trgt

tellraw @a[tag=t_debug] [{"type":"text","text":"classes/griefer/creeper_func_tick: aoe      eid_owner: "},{"type":"score","score":{"objective":"eid_owner","name":"@s"}},{"type":"text","text":" owner: "},{"type":"selector","selector":"@a[tag=t_creeper_owner]"},{"type":"text","text":" trgt: "},{"type":"selector","selector":"@a[tag=t_dmg_trgt]"}]

function cashgrab:util/npe_dmg {\
d_dmg_amount:10.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# Damage owner
tag @a[tag=t_creeper_owner,distance=..4] add t_dmg_trgt
tag @s add t_dmg_by
tag @s add t_dmg_from

tellraw @a[tag=t_debug] [{"type":"text","text":"classes/griefer/creeper_func_tick: selfdmg eid_owner: "},{"type":"score","score":{"objective":"eid_owner","name":"@s"}},{"type":"text","text":" owner: "},{"type":"selector","selector":"@a[tag=t_creeper_owner]"},{"type":"text","text":" trgt: "},{"type":"selector","selector":"@a[tag=t_dmg_trgt]"}]


function cashgrab:util/npe_dmg {\
d_dmg_amount:4.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

tag @a remove t_creeper_owner

# Destroy
scoreboard players reset @s
kill @s

# classes/alchemist/flametrap_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier step function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Expiration timer
scoreboard players remove @s cv_D 1
execute if score @s cv_D matches ..0 run tag @s add t_cleanup
execute if score @s cv_D matches ..0 run return 0

# The Flame Trap's entire arming and activation sequence uses the timer based on particular ranges of tmr_lifetime_ticks:
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		15	= trap trigger sfx and vfx
#	20-60	= trap is armed
#		21	= trap creates a puff of smoke
#	61-120	= trap is arming

# =================================
#	61-120	= trap is arming
execute if score @s tmr_lifetime_ticks matches 61..120 run particle minecraft:dust{color:[0.8f,0.2f,0.4f],scale:1.0} ~ ~ ~ 0 0 0 0 1

# =================================
#	20-60	= trap is armed
#		21	= trap creates a puff of smoke

execute if score @s tmr_lifetime_ticks matches 21 run function coinwars:util/pe_col_entity_filter_allies
execute if score @s tmr_lifetime_ticks matches 21 run particle minecraft:dust{color:[0.8f,0.2f,0.4f],scale:1.0} ~ ~-0.1 ~ 0.45 0.10 0.45 0 10 force @a[tag=!t_collision_candidate]
execute if score @s tmr_lifetime_ticks matches 21 run particle minecraft:smoke ~ ~-0.1 ~ 0.45 0.10 0.45 0 10 normal @a[tag=t_collision_candidate]
execute if score @s tmr_lifetime_ticks matches 21 run scoreboard players set @s tmr_lifetime_ticks 60

# Detect nearby enemies
execute if score @s tmr_lifetime_ticks matches 21..60 run function coinwars:util/pe_col_entity_filter_hostile
execute if score @s tmr_lifetime_ticks matches 21..60 if entity @e[distance=..2.5,tag=t_collision_candidate] run scoreboard players set @s tmr_lifetime_ticks 15

# =================================
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		14	= trap trigger sfx and vfx

execute if score @s tmr_lifetime_ticks matches 14 run function coinwars:util/pe_eid_find_owner
execute if score @s tmr_lifetime_ticks matches 14 run particle minecraft:smoke ~ ~ ~ 0.5 0.5 0.5 0 20
execute if score @s tmr_lifetime_ticks matches 14 run particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0 20
execute if score @s tmr_lifetime_ticks matches 14 run playsound minecraft:block.lever.click player @a ~ ~ ~ 0.5 1.5
execute if score @s tmr_lifetime_ticks matches 14 as @e[scores={eid_compare=0},limit=1] at @s run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.5
execute if score @s tmr_lifetime_ticks matches 14 run tellraw @a[scores={eid_compare=0},limit=1] {"color":"green","type":"text","text":"Someone has triggered one of your Flame Traps!"}

execute if score @s tmr_lifetime_ticks matches 2..13 run particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0 1

execute if score @s tmr_lifetime_ticks matches 1 run function coinwars:util/pe_eid_find_owner
execute if score @s tmr_lifetime_ticks matches 1 run particle minecraft:lava ~ ~ ~ 2.5 0.5 2.5 0 50
execute if score @s tmr_lifetime_ticks matches 1 run particle minecraft:flame ~ ~ ~ 2.5 0.5 2.5 0 50
execute if score @s tmr_lifetime_ticks matches 1 run playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 2.0
execute if score @s tmr_lifetime_ticks matches 1 as @e[scores={eid_compare=0},limit=1] at @s run playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 2.0
execute if score @s tmr_lifetime_ticks matches 1 run tag @e[scores={eid_compare=0},limit=1] add t_dmg_src
execute if score @s tmr_lifetime_ticks matches 1 run tag @s add t_dmg_loc
execute if score @s tmr_lifetime_ticks matches 1 run function coinwars:util/pe_col_entity_filter_hostile
execute if score @s tmr_lifetime_ticks matches 1 as @e[tag=t_collision_candidate,distance=..4.5] run damage @s 7.0 minecraft:fireball by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_dmg_loc,limit=1,sort=nearest]
execute if score @s tmr_lifetime_ticks matches 1 run effect give @e[tag=t_collision_candidate,distance=..4] minecraft:glowing 10 0
execute if score @s tmr_lifetime_ticks matches 1 run tag @e[tag=t_dmg_src] remove t_dmg_src
execute if score @s tmr_lifetime_ticks matches 1 run tag @e[tag=t_dmg_loc] remove t_dmg_loc

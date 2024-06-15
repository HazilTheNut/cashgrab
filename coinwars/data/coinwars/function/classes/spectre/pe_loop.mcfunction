# classes/spectre/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 3
#	at: the entity
#
# Summary: Loop function for Spectre class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Invisibility effect for visuals (still wears armor by default)
effect give @s minecraft:invisibility infinite 0 true

# Shadow Walk enter state
scoreboard players set @s[scores={ps_sneaking=2,cv_A=0,cv_B=1..}] cv_A 2
execute if score @s cv_A matches 2 run function coinwars:base/pe_refresh_inv
execute if score @s cv_A matches 2 run particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40
execute if score @s cv_A matches 2 run effect give @s minecraft:speed 3 10 true
execute if score @s cv_A matches 2 run tag @s add t_do_not_track
execute if score @s cv_A matches 2 run scoreboard players set @s cv_A 1

# Shadow Walk tick down
scoreboard players remove @s[scores={cv_A=1,cv_B=0..}] cv_B 1
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. store result storage coinwwars:spectre_args data.count int 1 run scoreboard players get @s cv_B
execute if score @s cv_A matches 1 if score @s cv_B matches 1.. run function coinwars:classes/spectre/pe_display_shadow_walk with storage coinwwars:spectre_args data
execute if score @s cv_A matches 1 if score @s cv_B matches ..0 run item replace entity @s hotbar.5 with minecraft:air

# Shadow Walk exit state
scoreboard players set @s[scores={cv_A=1,cv_B=..0}] cv_A -1
scoreboard players set @s[scores={ps_sneaking=-1,cv_A=1}] cv_A -1
execute if score @s cv_A matches -1 run function coinwars:base/pe_refresh_inv
execute if score @s cv_A matches -1 run particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40
execute if score @s cv_A matches -1 run effect clear @s minecraft:speed
execute if score @s cv_A matches -1 run tag @s remove t_do_not_track
execute if score @s cv_A matches -1 run scoreboard players set @s cv_C 100
execute if score @s cv_A matches -1 run scoreboard players set @s cv_A 0

# Shadow Walk cooldown
scoreboard players remove @s[scores={cv_C=0..}] cv_C 1
execute if score @s cv_C matches 0 run scoreboard players set @s cv_B 60
execute if score @s cv_C matches 0 store result storage coinwwars:spectre_args data.count int 1 run scoreboard players get @s cv_B
execute if score @s cv_C matches 0 run function coinwars:classes/spectre/pe_display_shadow_walk with storage coinwwars:spectre_args data

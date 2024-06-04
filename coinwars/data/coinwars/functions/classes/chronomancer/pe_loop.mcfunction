# classes/chronomancer/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 10
#	at: the entity
#
# Summary: Loop function for Chronomancer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Track position of the crossbow in inventory
scoreboard players set @s cv_A 0
execute if items entity @s weapon.offhand minecraft:crossbow run scoreboard players set @s cv_A 1

# Track loaded state of crossbow
scoreboard players set @s cv_C 1
execute if items entity @s hotbar.* minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[]] run scoreboard players set @s cv_C 0
execute if items entity @s weapon.* minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[]] run scoreboard players set @s cv_C 0

# Upon firing an arrow, initiate reload timer
execute if score @s ev_crossbows matches 1.. run scoreboard players set @s cv_B 50

# Decrement reload timer and reload when complete
scoreboard players remove @s[scores={cv_B=0..}] cv_B 1
scoreboard players remove @s[scores={cv_B=5..},tag=t_stasis] cv_B 5
execute if score @s cv_B matches 0 run scoreboard players set @s cv_C 1
execute if score @s cv_B matches 0 run function coinwars:classes/chronomancer/update_crossbow

# Update crossbow after firing an arrow
execute if score @s ev_crossbows matches 1.. run function coinwars:classes/chronomancer/update_crossbow

# Update Crossbow when entering or exiting stasis
execute if score @s stasis_state matches -1 run function coinwars:classes/chronomancer/update_crossbow
execute if score @s stasis_state matches 2 run function coinwars:classes/chronomancer/update_crossbow


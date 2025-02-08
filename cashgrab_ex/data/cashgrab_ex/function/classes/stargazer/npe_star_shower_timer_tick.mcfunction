# classes/stargazer/npe_star_shower_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Star Shower timer tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer	
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# vfx
particle minecraft:entity_effect{color:[1.0,1.0,0.8,1.0]} ~ ~ ~ 0.02 0.02 0.02 0 1

# ========================
# Fire missile
scoreboard players add @s cv_F 1
execute unless score @s cv_F matches 2 run return 0

# ========================
# Get random yaw and pitch values

# Yaw
execute store result score @s temp_A run random roll 1..40
scoreboard players operation @s cv_G += @s temp_A
scoreboard players set @s[scores={cv_G=40..}] cv_G -40
#scoreboard players set @s cv_G 0
execute store result storage cashgrab_ex:stargazer_args dyaw int 1 run scoreboard players get @s cv_G

# Pitch
execute store result score @s temp_A run random roll 1..15
scoreboard players operation @s cv_H += @s temp_A
scoreboard players set @s[scores={cv_H=20..}] cv_H -30
#scoreboard players set @s cv_H 0
execute store result storage cashgrab_ex:stargazer_args dpitch int 1 run scoreboard players get @s cv_H

function cashgrab_ex:classes/stargazer/npe_star_shower_timer_fire_missile with storage cashgrab_ex:stargazer_args
scoreboard players set @s cv_F 0

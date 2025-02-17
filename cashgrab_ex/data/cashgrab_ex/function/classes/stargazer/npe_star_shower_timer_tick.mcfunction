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

execute if score @s stasis_state matches 1..2 run return 0

# Wait a short period before firing missiles
execute if score @s tmr_lifetime_ticks matches 141.. run return 0

# ========================
# Fire missile 
scoreboard players add @s cv_F 1
execute unless score @s cv_F matches 4 run return 0

# ========================
# Get random yaw and pitch values

# Yaw
execute store result score @s temp_A run random value 1..30
scoreboard players operation @s cv_G += @s temp_A
scoreboard players remove @s[scores={cv_G=33..}] cv_G 66
#scoreboard players set @s cv_G 0
execute store result storage cashgrab_ex:stargazer_args dyaw int 1 run scoreboard players get @s cv_G

# Speed
execute store result score @s temp_A run random value 1..15
scoreboard players operation @s cv_H += @s temp_A
scoreboard players remove @s[scores={cv_H=75..}] cv_H 52
#scoreboard players set @s cv_H 0
execute store result storage cashgrab_ex:stargazer_args f_speed_mpt float 0.01 run scoreboard players get @s cv_H

function cashgrab_ex:classes/stargazer/npe_star_shower_timer_fire_missile with storage cashgrab_ex:stargazer_args
scoreboard players set @s cv_F 0

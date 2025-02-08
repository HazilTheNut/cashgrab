# classes/stargazer/npe_vortex_snare_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vortex Snare missile tick function
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
particle minecraft:dust{color:[0.35,0.15,0.55],scale:1} ~ ~ ~ 0.02 0.02 0.02 0 1
particle minecraft:portal ~ ~ ~ 0.75 0.75 0.75 1 1

execute if score @s stasis_state matches 1..2 run return 0

# sfx
scoreboard players add @s cv_E 1
execute if score @s cv_E matches 5 run playsound minecraft:entity.breeze.inhale player @a ~ ~ ~ 0.25 0.75
execute if score @s cv_E matches 5 run scoreboard players set @s cv_E 0

# Slow down missile
execute store result entity @s data.f_speed_mpt float 0.000865 run data get entity @s data.f_speed_mpt 1000
tag @s add t_missile_calc_base_vel

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

# vfx
particle minecraft:dust{color:[0.35,0.15,0.55],scale:1} ~ ~ ~ 0.02 0.02 0.02 0 1

execute if score @s stasis_state matches 1..2 run return 0

# Slow down missile
execute store result entity @s data.f_speed_mpt float 0.000865 run data get entity @s data.f_speed_mpt 1000
tag @s add t_missile_calc_base_vel

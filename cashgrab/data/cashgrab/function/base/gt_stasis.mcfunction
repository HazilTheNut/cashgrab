# base/gt_stasis.mcfunction
#
# Context: Global tick
#
# Summary: Handles entity stasis mechanic
#
# Arguments: (none)

# Update stasis_state based on presence of t_stasis and absence of t_stasis_immune
scoreboard players add @e stasis_state 0

scoreboard players set @e[tag=t_stasis,tag=!t_stasis_immune,scores={stasis_state=2}] stasis_state 1
scoreboard players set @e[tag=t_stasis,tag=!t_stasis_immune,scores={stasis_state=-1..0}] stasis_state 2

scoreboard players set @e[tag=!t_stasis,tag=!t_stasis_immune,scores={stasis_state=-1}] stasis_state 0
scoreboard players set @e[tag=!t_stasis,tag=!t_stasis_immune,scores={stasis_state=1..2}] stasis_state -1

# Apply stasis effects to projectiles
execute as @e[type=#cashgrab:projectile,scores={stasis_state=1..2}] at @s run function cashgrab:base/pe_stasis_projectile
execute as @e[type=#cashgrab:projectile,scores={stasis_state=-1}] at @s run function cashgrab:base/pe_stasis_projectile

# Remove t_stasis tag. To continue applying stasis, the tag must be issued repeatedly on each server tick
tag @e[tag=t_stasis] remove t_stasis

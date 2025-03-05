# trinkets/lava_cake/lava_cake_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Lava Cake timer end
# 
# Arguments:
#	end_reason	: The reason for why the end function was called

$tellraw @a[tag=t_debug] "trinkets/lava_cake/lava_cake_timer_end end_reason $(end_reason)"
$execute unless score NUM_END_REASON_EXPIRE num matches $(end_reason) run return 0

#Particle effect
particle minecraft:explosion ~ ~ ~ 2.5 0.25 2.5 0 7
particle minecraft:lava ~ ~ ~ 5 0.25 5 5 75
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1

execute if entity @e[distance=0..5,tag=!t_timer_owner] run tag @e[distance=0..5,tag=!t_timer_owner] add t_in_range

# Damage players nearby
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:10.0,\
s_dmg_type:"minecraft:player_explosion",\
t_dmg_target:"t_in_range",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_timer_owner",\
b_remove_tags:1\
}
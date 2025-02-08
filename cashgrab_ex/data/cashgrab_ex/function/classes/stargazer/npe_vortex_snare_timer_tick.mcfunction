# classes/stargazer/npe_vortex_snare_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Rift Glyph timer tick function
#
# Arguments: (none)

# vfx
execute if score @s tmr_lifetime_ticks matches 80.. run particle minecraft:dust{color:[0.35,0.15,0.55],scale:1} ~ ~ ~ 0.02 0.02 0.02 0 1
execute if score @s tmr_lifetime_ticks matches ..79 run particle minecraft:dust{color:[0.35,0.15,0.55],scale:1} ~ ~ ~ 0.3 0.5 0.3 0 1
particle minecraft:portal ~ ~ ~ 0.75 0.75 0.75 1 1

# sfx
scoreboard players add @s cv_E 1
execute if score @s cv_E matches 5 run playsound minecraft:entity.breeze.inhale player @a ~ ~ ~ 0.25 0.75
execute if score @s cv_E matches 5 run scoreboard players set @s cv_E 0

# When lifetime reaches 79, grab a nearby hostile creature
execute unless score @s tmr_lifetime_ticks matches 79 run return 0

# sfx / vfx
particle minecraft:dust{color:[0.35,0.15,0.55],scale:1} ~ ~ ~ 1.5 1.5 1.5 0 30
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1.0 0.75

function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-3 ~-4 ~-3 run scoreboard players operation @n[tag=t_collision_candidate,dx=5,dy=8,dz=5] eid_grabbed_by = @s eid_self

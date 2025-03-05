# trinkets/flame_trap/npe_flametrap_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Alchemist's Flame Trap timer tick function
#
# Arguments: (none)

# Trinket variable usage:
#	tv_A	:	Flame Trap expiration timer
#	tv_B	:	
#	tv_C	:	
#	tv_D	:	

# Expiration timer
scoreboard players remove @s tv_A 1
execute if score @s tv_A matches ..0 run tag @s add t_cleanup
execute if score @s tv_A matches ..0 run return 0

# The Flame Trap's entire arming and activation sequence uses the timer based on particular ranges of tmr_lifetime_ticks:
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		15	= trap trigger sfx and vfx
#	20-60	= trap is armed
#		21	= trap creates a puff of smoke
#	61-80	= trap is arming

# =================================
#	1-15	= trap is tripped and about to explode
#		1	= create explosion
#		14	= trap trigger sfx and vfx

execute if score @s tmr_lifetime_ticks matches 2..13 run particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0 1

# Only create the above flame particles when the trap is tripped while in stasis
execute if score @s stasis_state matches 1..2 run return 0

execute if score @s tmr_lifetime_ticks matches 14 run function cashgrab_ex:trinkets/flame_trap/npe_flametrap_timer_trip
execute if score @s tmr_lifetime_ticks matches 1 run function cashgrab_ex:trinkets/flame_trap/npe_flametrap_timer_explode

# =================================
#	61-80	= trap is arming
execute if score @s tmr_lifetime_ticks matches 61..80 run particle minecraft:dust{color:[0.8f,0.2f,0.4f],scale:1.0} ~ ~ ~ 0 0 0 0 1
execute if score @s tmr_lifetime_ticks matches 61 run playsound minecraft:entity.tnt.primed player @a ~ ~ ~ 0.5 2.0
execute if score @s tmr_lifetime_ticks matches 61 run function cashgrab:util/npe_col_entity_filter_hostile
execute if score @s tmr_lifetime_ticks matches 61 if entity @e[distance=..4,tag=t_collision_candidate,tag=!t_invisible] run scoreboard players set @s tmr_lifetime_ticks 80


# =================================
#	30-60	= trap is armed
#		31	= trap creates a puff of smoke

execute if score @s tmr_lifetime_ticks matches 31 run function cashgrab:util/npe_col_entity_filter_allies
execute if score @s tmr_lifetime_ticks matches 31 run particle minecraft:dust{color:[0.8f,0.2f,0.4f],scale:1.0} ~ ~-0.1 ~ 0.55 0.10 0.55 0 15 force @a[tag=!t_collision_candidate]
execute if score @s tmr_lifetime_ticks matches 31 run particle minecraft:smoke ~ ~-0.1 ~ 0.55 0.10 0.55 0 15 normal @a[tag=t_collision_candidate]
execute if score @s tmr_lifetime_ticks matches 31 run scoreboard players set @s tmr_lifetime_ticks 60

# Detect nearby enemies
execute if score @s tmr_lifetime_ticks matches 31..60 run function cashgrab:util/npe_col_entity_filter_hostile
execute if score @s tmr_lifetime_ticks matches 31..60 if entity @e[distance=..2.5,tag=t_collision_candidate,tag=!t_invisible] run scoreboard players set @s tmr_lifetime_ticks 15


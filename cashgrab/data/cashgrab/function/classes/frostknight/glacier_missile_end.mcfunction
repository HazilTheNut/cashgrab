# classes/frostknight/glacier_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Frost Knight's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

$scoreboard players set @s temp_A $(end_reason)

execute unless score @s temp_A matches 1 run return 0

# Measure height on glacier
scoreboard players set @s cv_H 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:air unless block ~ ~1 ~ minecraft:air run scoreboard players set @s cv_H 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:air if block ~ ~1 ~ minecraft:air run scoreboard players set @s cv_H 2

execute if score @s cv_H matches 0 run return 0

execute align xyz positioned ~0.5 ~0.5 ~0.5 if score @s cv_H matches 1 run fill ~ ~ ~ ~ ~ ~ minecraft:packed_ice
execute align xyz positioned ~0.5 ~0.5 ~0.5 if score @s cv_H matches 2 run fill ~ ~ ~ ~ ~1 ~ minecraft:packed_ice

# Set glacier timer
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:162,\
b_anchor_at_pos:1,\
t_timer_name:"t_frostknight_glacier_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/frostknight/glacier_timer_tick",\
func_npe_end:"cashgrab:classes/frostknight/glacier_timer_end",\
b_assign_as_peer:1,\
}

# Configure glacier timer
#scoreboard players operation @e[tag=t_frostknight_glacier_timer_init,limit=1,sort=nearest] eid_owner = @s eid_owner
scoreboard players operation @e[tag=t_frostknight_glacier_timer_init,limit=1,sort=nearest] cv_H = @s cv_H
tag @e[tag=t_frostknight_glacier_timer_init,limit=1,sort=nearest] add t_frostknight_glacier_timer
tag @e[tag=t_frostknight_glacier_timer_init,limit=1,sort=nearest] remove t_frostknight_glacier_timer_init

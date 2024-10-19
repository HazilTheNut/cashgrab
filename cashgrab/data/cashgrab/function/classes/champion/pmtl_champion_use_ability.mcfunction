# classes/champion/pmtl_champion_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Start sequence timer
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 60

# Grant speed bonus to yourself and allies
function cashgrab:util/npe_col_entity_filter_allies
effect give @e[tag=t_collision_candidate,distance=..5] minecraft:speed 3 1 true

# Display particles
playsound minecraft:entity.wind_charge.wind_burst player @a ~ ~ ~ 1.0 0.75
execute if score @a[tag=t_pm_owner,limit=1] team_id matches 0 run particle minecraft:effect ~ ~0.4 ~ 1.0 0.1 1.0 0 25
execute if score @a[tag=t_pm_owner,limit=1] team_id matches 1.. run particle minecraft:effect ~ ~0.4 ~ 2.5 0.1 2.5 0 50

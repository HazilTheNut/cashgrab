# classes/alchemist/pe_use_ability.mcfunction
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
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport, 2 = update display for teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	Translocator entity count
#	cv_H	:	

# Search for existing translocators
function cashgrab:util/npe_eid_find_peers
execute store result score @s cv_G run execute if entity @e[tag=t_alchemist_translocator,scores={eid_compare=0}]

# If no translocators exist, throw one
execute if score @s cv_G matches 0 run function cashgrab:classes/alchemist/pmtl_alchemist_use_ability_throw

# If a translocator exists, begin teleport sequence
execute if score @s cv_G matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_F 20
execute if score @s cv_G matches 1.. run effect give @a[tag=t_pm_owner,limit=1] minecraft:slowness 1 2
execute if score @s cv_G matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 10000
execute if score @s cv_G matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 0

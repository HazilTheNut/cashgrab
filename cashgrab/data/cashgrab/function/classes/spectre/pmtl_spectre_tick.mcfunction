# classes/spectre/pmtl_spectre_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Spectre class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Invisibility effect for visuals (still wears armor by default)
effect give @a[tag=t_pm_owner,limit=1] minecraft:invisibility infinite 0 true

# Shadow Walk enter state
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=0,cv_B=1..}] cv_A 2
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run function cashgrab:classes/spectre/pmtl_spectre_shadow_walk_enter

# Shadow Walk tick down
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=0..}] cv_B 1
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run function cashgrab:classes/spectre/pmtl_spectre_shadow_walk_active

# Shadow Walk exit state
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=..0}] cv_A -1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=-1,cv_A=1}] cv_A -1
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches -1 run function cashgrab:classes/spectre/pmtl_spectre_shadow_walk_exit

# Shadow Walk cooldown
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_C=0..}] cv_C 1

# Refill Shadow Walk when cooldown ends
execute unless score @a[tag=t_pm_owner,limit=1] cv_C matches 0 run return 0
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 60
execute store result storage cashgrab:spectre_args data.count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B
function cashgrab:classes/spectre/pmt_spectre_inv_shadow_walk with storage coinwwars:spectre_args data

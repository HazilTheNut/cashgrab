# tutorial/trainee/pmtl_trainee_tick_wall_climb.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Wall Climb effect for Trainee class (copied from Ranger)
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	If player is holding the weapon (==> cv_F = 1)
#	cv_G	:	
#	cv_H	:	

# Wall Climb enter state
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1..2,cv_A=0,cv_B=1..,cv_F=1}] cv_A 2
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run effect give @a[tag=t_pm_owner,limit=1] minecraft:levitation 3 10 true
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1

# Wall Climb active state
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run function cashgrab:classes/ranger/pmtl_ranger_wall_climb_active

# Wall Climb sound effects
scoreboard players remove @a[tag=t_pm_owner,limit=1,tag=t_ranger_climb,scores={cv_C=1..}] cv_C 1
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_ranger_climb,scores={cv_C=0}] run playsound minecraft:block.stone.step player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.5 1.0
scoreboard players set @a[tag=t_pm_owner,limit=1,tag=t_ranger_climb,scores={cv_C=..0}] cv_C 2

# Wall Climb levitation effect
effect clear @a[tag=t_pm_owner,limit=1,tag=!t_ranger_climb,scores={cv_A=1}] minecraft:levitation
effect give @a[tag=t_pm_owner,limit=1,tag=t_ranger_climb,scores={cv_A=1}] minecraft:levitation 3 10 true
tag @a[tag=t_pm_owner,limit=1] remove t_ranger_climb

# Wall Climb exit state
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1,cv_B=..0}] cv_A -1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=-1,cv_A=1}] cv_A -1
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches -1 run effect clear @a[tag=t_pm_owner,limit=1] minecraft:levitation
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0

# Refresh Wall Climb upon landing on the ground
execute if score @a[tag=t_pm_owner,limit=1] ps_falling matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 25
execute if score @a[tag=t_pm_owner,limit=1] ps_falling matches -1 run function cashgrab:tutorial/trainee/pmt_trainee_inv_climbing_energy {count:25}

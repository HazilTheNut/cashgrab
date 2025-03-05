# tutorial/trainee/pmtl_trainee_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Trainee class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	If player is holding the weapon (==> cv_F = 1)

# Track if player is holding the weapon (==> cv_F = 1)
execute store result score @a[tag=t_pm_owner,limit=1] cv_F run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.mainhand minecraft:wooden_sword

# If player has achieved sufficient progress, run Wall Climb ability
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches 3.. run function cashgrab:tutorial/trainee/pmtl_trainee_tick_wall_climb

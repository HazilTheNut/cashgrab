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

# Track if player is holding the weapon (==> cv_A = 1)
execute store result score @a[tag=t_pm_owner,limit=1] cv_A run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.mainhand minecraft:wooden_sword

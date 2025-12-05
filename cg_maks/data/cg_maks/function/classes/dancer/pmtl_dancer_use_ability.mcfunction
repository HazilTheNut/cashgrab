# classes/vampire/pmtl_dancer_use_ability.mcfunction
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
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer
#	cv_D	:	Sound Effect timer (base)
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	Sound Effect timer (refresh buff)
#	cv_G	:	Refresh Buff Timer Cooldown / Sforzando missile pitch deflection (mdeg)
#	cv_H	:   Sforzando missile yaw deflection (mdeg)

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 8

# Initialize yaw deflection
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=..0}] cv_H -15000
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] cv_H -22500
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=2}] cv_H -30000
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=3..}] cv_H -37500
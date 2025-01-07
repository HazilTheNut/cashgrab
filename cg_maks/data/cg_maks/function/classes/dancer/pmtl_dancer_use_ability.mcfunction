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
#	cv_D	:	Sound Effect timer
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	
#	cv_G	:	
#	cv_H	:

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 8
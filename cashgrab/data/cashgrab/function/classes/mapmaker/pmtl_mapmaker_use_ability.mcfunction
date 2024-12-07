# classes/mapmaker/pmtl_mapmaker_use_ability.mcfunction
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
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

# Toggle cv_A value
scoreboard players add @a[tag=t_pm_owner] cv_A 1
scoreboard players set @a[tag=t_pm_owner,scores={cv_A=2..}] cv_A 0

effect give @a[tag=t_pm_owner,scores={cv_A=1}] minecraft:night_vision infinite
effect clear @a[tag=t_pm_owner,scores={cv_A=0}] minecraft:night_vision

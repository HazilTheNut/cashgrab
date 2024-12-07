# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

execute store result score @a[tag=t_pm_owner,limit=1] cv_E run data get entity @a[tag=t_pm_owner,limit=1] Pos[0]
execute store result score @a[tag=t_pm_owner,limit=1] cv_F run data get entity @a[tag=t_pm_owner,limit=1] Pos[1]
execute store result score @a[tag=t_pm_owner,limit=1] cv_G run data get entity @a[tag=t_pm_owner,limit=1] Pos[2]

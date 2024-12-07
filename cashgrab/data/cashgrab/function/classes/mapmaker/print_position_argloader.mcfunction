# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

execute store result storage cashgrab:mapmaker_print_args player_pos_x int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[0]
execute store result storage cashgrab:mapmaker_print_args player_pos_y int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[1]
execute store result storage cashgrab:mapmaker_print_args player_pos_z int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[2]

execute store result storage cashgrab:mapmaker_print_args player_rot_yaw int 1 run data get entity @a[tag=t_pm_owner,limit=1] Rotation[0]
execute store result storage cashgrab:mapmaker_print_args player_rot_pitch int 1 run data get entity @a[tag=t_pm_owner,limit=1] Rotation[1]

function cashgrab:classes/mapmaker/print_position with storage cashgrab:mapmaker_print_args

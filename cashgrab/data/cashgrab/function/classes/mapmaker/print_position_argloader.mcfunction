# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

# Player position
execute store result storage cashgrab:mapmaker_print_args player_pos_x int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[0]
execute store result storage cashgrab:mapmaker_print_args player_pos_y int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[1]
execute store result storage cashgrab:mapmaker_print_args player_pos_z int 1 run data get entity @a[tag=t_pm_owner,limit=1] Pos[2]

# Player rotation
execute store result storage cashgrab:mapmaker_print_args player_rot_yaw int 1 run data get entity @a[tag=t_pm_owner,limit=1] Rotation[0]
execute store result storage cashgrab:mapmaker_print_args player_rot_pitch int 1 run data get entity @a[tag=t_pm_owner,limit=1] Rotation[1]

# Relative to anchor
execute store result score @a[tag=t_pm_owner,limit=1] cv_B run data get entity @a[tag=t_pm_owner,limit=1] Pos[0]
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_B -= @a[tag=t_pm_owner,limit=1] cv_E
execute store result storage cashgrab:mapmaker_print_args player_rel_x int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B

execute store result score @a[tag=t_pm_owner,limit=1] cv_B run data get entity @a[tag=t_pm_owner,limit=1] Pos[1]
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_B -= @a[tag=t_pm_owner,limit=1] cv_F
execute store result storage cashgrab:mapmaker_print_args player_rel_y int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B

execute store result score @a[tag=t_pm_owner,limit=1] cv_B run data get entity @a[tag=t_pm_owner,limit=1] Pos[2]
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_B -= @a[tag=t_pm_owner,limit=1] cv_G
execute store result storage cashgrab:mapmaker_print_args player_rel_z int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B

function cashgrab:classes/mapmaker/print_position with storage cashgrab:mapmaker_print_args

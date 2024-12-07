# classes/mapmaker/pmt_mapmaker_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
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

item replace entity @a[tag=t_pm_owner,scores={cv_A=0}] hotbar.4 with minecraft:ink_sac[\
minecraft:custom_name="{\"text\":\"Toggle Tools\"}"]
item replace entity @a[tag=t_pm_owner,scores={cv_A=1}] hotbar.4 with minecraft:glow_ink_sac[\
minecraft:custom_name="{\"text\":\"Toggle Tools\"}"]

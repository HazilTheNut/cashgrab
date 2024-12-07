# classes/mapmaker/pmt_mapmaker_inv.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates inventory for the Mapmaker class for the command executor
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

# Armor
item replace entity @a[tag=t_pm_owner] armor.head with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.chest with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.legs with minecraft:air
item replace entity @a[tag=t_pm_owner] armor.feet with minecraft:air

# Hotbar
execute if entity @a[tag=t_pm_owner,scores={cv_H=0}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv_page_one
execute if entity @a[tag=t_pm_owner,scores={cv_H=1}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv_page_two

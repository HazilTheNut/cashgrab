# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

#particle smoke ~ ~ ~ 0 0 0 0 1

execute if block ~ ~ ~ #cashgrab:lockable run data modify block ~ ~ ~ lock set value {components:{"minecraft:custom_data":{can_open_locked_things:1}}}

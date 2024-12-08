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

# Hotbar
item replace entity @a[tag=t_pm_owner] hotbar.0 with minecraft:egg[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Change Pages\"}",\
minecraft:custom_data={mapmaker_tool_id:1}] 2

item replace entity @a[tag=t_pm_owner] hotbar.1 with minecraft:egg[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Update Lighting\"}",\
minecraft:custom_data={mapmaker_tool_id:21}]
item replace entity @a[tag=t_pm_owner] hotbar.2 with minecraft:egg[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Lock Blocks\"}",\
minecraft:custom_data={mapmaker_tool_id:22}]

item replace entity @a[tag=t_pm_owner] hotbar.5 with minecraft:egg[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Set Anchor\"}",\
minecraft:custom_data={mapmaker_tool_id:25}]
item replace entity @a[tag=t_pm_owner] hotbar.6 with minecraft:egg[\
minecraft:custom_name="{\"italic\":false,\"text\":\"Print Position\"}",\
minecraft:custom_data={mapmaker_tool_id:26}]

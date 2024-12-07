# classes/mapmaker/pmtl_mapmaker_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Mapmaker class
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

# --- Change Pages
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run scoreboard players add @a[tag=t_pm_owner] cv_H 1
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run scoreboard players set @a[tag=t_pm_owner,scores={cv_H=2..}] cv_H 0
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run item replace entity @a[tag=t_pm_owner] hotbar.1 with minecraft:air
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run item replace entity @a[tag=t_pm_owner] hotbar.2 with minecraft:air
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:air
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run item replace entity @a[tag=t_pm_owner] hotbar.5 with minecraft:air
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,ps_selected_hotbar_slot=0}] run item replace entity @a[tag=t_pm_owner] hotbar.6 with minecraft:air

# --- Smooth Tool
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:11}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/smooth_block"}

# --- Topsoil Tool
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:12}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/topsoil_block"}

# --- Leveler Tool
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:13}] run function cashgrab:classes/mapmaker/leveler_tick

# --- Shoot Fireball

# fire erasure
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:15}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:16}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire

# fireball creation
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,cv_H=0,ps_selected_hotbar_slot=5..6}] run function cashgrab:classes/mapmaker/summon_fireball

# --- Update Lighting
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,cv_H=1,ps_selected_hotbar_slot=1}] run scoreboard players set @a[tag=t_pm_owner] cv_C 2

# --- Lock Blocks
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,cv_H=1,ps_selected_hotbar_slot=2}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/lock_block"} 

# --- Print Position
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..,cv_H=1,ps_selected_hotbar_slot=6}] run function cashgrab:classes/mapmaker/print_position_argloader

# --- misc

# Replenish items in hotbar
execute if entity @a[tag=t_pm_owner,scores={evc_eggs=1..}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv

# Consume event
scoreboard players set @a[tag=t_pm_owner] evc_eggs 0

# Update lighting sequence
execute if entity @a[tag=t_pm_owner,scores={cv_C=2}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:light[level=2] replace minecraft:air
execute if entity @a[tag=t_pm_owner,scores={cv_C=1}] run fill ~-12 ~-12 ~-12 ~12 ~12 ~12 minecraft:air replace minecraft:light

scoreboard players remove @a[tag=t_pm_owner,scores={cv_C=1..}] cv_C 1

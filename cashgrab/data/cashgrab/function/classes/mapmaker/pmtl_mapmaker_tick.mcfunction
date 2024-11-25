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

execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:1}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/smooth_block"}
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:2}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/topsoil_block"}

execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:3}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire
execute if items entity @a[tag=t_pm_owner,scores={cv_A=1}] weapon.mainhand *[minecraft:custom_data={mapmaker_tool_id:4}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire

execute if entity @a[tag=t_pm_owner,scores={evc_maps=1..,ps_selected_hotbar_slot=2..3}] run function cashgrab:classes/mapmaker/summon_fireball
execute if entity @a[tag=t_pm_owner,scores={evc_maps=1..,ps_selected_hotbar_slot=5}] run scoreboard players set @a[tag=t_pm_owner] cv_C 2
execute if entity @a[tag=t_pm_owner,scores={evc_maps=1..,ps_selected_hotbar_slot=6}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/lock_block"} 

# Replenish maps in hotbar
execute if entity @a[tag=t_pm_owner,scores={evc_maps=1..}] run function cashgrab:classes/mapmaker/pmt_mapmaker_inv
clear @a[tag=t_pm_owner,scores={evc_maps=1..}] minecraft:filled_map

# Consume event
scoreboard players set @a[tag=t_pm_owner] evc_maps 0

# Update lighting sequence
execute if entity @a[tag=t_pm_owner,scores={cv_C=2}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:light[level=2] replace minecraft:air
execute if entity @a[tag=t_pm_owner,scores={cv_C=1}] run fill ~-12 ~-12 ~-12 ~12 ~12 ~12 minecraft:air replace minecraft:light

scoreboard players remove @a[tag=t_pm_owner,scores={cv_C=1..}] cv_C 1

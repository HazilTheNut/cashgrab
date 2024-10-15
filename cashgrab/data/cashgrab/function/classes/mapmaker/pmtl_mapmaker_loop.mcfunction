# classes/mapmaker/pmtl_mapmaker_loop.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Loop function for Mapmaker class
#
# Arguments: (none)

execute if entity @a[tag=t_pm_owner,scores={cv_A=1,ps_selected_hotbar_slot=0},nbt={SelectedItem:{components:{"minecraft:item_name":'"Smoothing Tool"'}}}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/smooth_block"}
execute if entity @a[tag=t_pm_owner,scores={cv_A=1,ps_selected_hotbar_slot=1},nbt={SelectedItem:{components:{"minecraft:item_name":'"Topsoil Tool"'}}}] run function cashgrab:classes/mapmaker/run_over_volume {func:"cashgrab:classes/mapmaker/topsoil_block"}

execute if entity @a[tag=t_pm_owner,scores={cv_A=1,ps_selected_hotbar_slot=2..3},nbt={SelectedItem:{components:{"minecraft:item_name":'"Shoot] Fireball (strong)"'}}}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire
execute if entity @a[tag=t_pm_owner,scores={cv_A=1,ps_selected_hotbar_slot=2..3},nbt={SelectedItem:{components:{"minecraft:item_name":'"Shoot] Fireball (weak)"'}}}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire

execute if entity @a[tag=t_pm_owner,scores={ev_maps=1..,ps_selected_hotbar_slot=2..3}] run function cashgrab:classes/mapmaker/summon_fireball
execute if entity @a[tag=t_pm_owner,scores={ev_maps=1..,ps_selected_hotbar_slot=5}] run scoreboard players set @a[tag=t_pm_owner] cv_C 2
item replace entity @a[tag=t_pm_owner,scores={ev_maps=1..}] hotbar.2 with minecraft:map[\
minecraft:item_name="{\"text\":\"Shoot Fireball (strong)\"}"]
item replace entity @a[tag=t_pm_owner,scores={ev_maps=1..}] hotbar.3 with minecraft:map[\
minecraft:item_name="{\"text\":\"Shoot Fireball (weak)\"}"]
item replace entity @a[tag=t_pm_owner,scores={ev_maps=1..}] hotbar.5 with minecraft:map[\
minecraft:item_name="{\"text\":\"Update Lighting\"}"]
clear @a[tag=t_pm_owner,scores={ev_maps=1..}] minecraft:filled_map
scoreboard players set @a[tag=t_pm_owner] ev_maps 0

execute if entity @a[tag=t_pm_owner,scores={cv_C=2}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:light[level=2] replace minecraft:air
execute if entity @a[tag=t_pm_owner,scores={cv_C=1}] run fill ~-12 ~-12 ~-12 ~12 ~12 ~12 minecraft:air replace minecraft:light

scoreboard players remove @a[tag=t_pm_owner,scores={cv_C=1..}] cv_C 1

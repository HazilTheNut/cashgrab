# classes/mapmaker/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = -10
#	at: the entity
#
# Summary: Loop function for Mapmaker class
#
# Arguments: (none)

execute if entity @s[scores={cv_A=1,ps_selected_hotbar_slot=0},nbt={SelectedItem:{components:{"minecraft:item_name":'"Smoothing Tool"'}}}] run function coinwars:classes/mapmaker/run_over_volume {func:"coinwars:classes/mapmaker/smooth_block"}
execute if entity @s[scores={cv_A=1,ps_selected_hotbar_slot=1},nbt={SelectedItem:{components:{"minecraft:item_name":'"Topsoil Tool"'}}}] run function coinwars:classes/mapmaker/run_over_volume {func:"coinwars:classes/mapmaker/topsoil_block"}

execute if entity @s[scores={cv_A=1,ps_selected_hotbar_slot=2..3},nbt={SelectedItem:{components:{"minecraft:item_name":'"Shoot Fireball (strong)"'}}}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire
execute if entity @s[scores={cv_A=1,ps_selected_hotbar_slot=2..3},nbt={SelectedItem:{components:{"minecraft:item_name":'"Shoot Fireball (weak)"'}}}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:fire

execute if entity @s[scores={ev_maps=1..,ps_selected_hotbar_slot=2..3}] run function coinwars:classes/mapmaker/summon_fireball
execute if entity @s[scores={ev_maps=1..,ps_selected_hotbar_slot=5}] run scoreboard players set @s cv_C 2
item replace entity @s[scores={ev_maps=1..}] hotbar.2 with minecraft:map[\
minecraft:item_name="{\"text\":\"Shoot Fireball (strong)\"}"]
item replace entity @s[scores={ev_maps=1..}] hotbar.3 with minecraft:map[\
minecraft:item_name="{\"text\":\"Shoot Fireball (weak)\"}"]
item replace entity @s[scores={ev_maps=1..}] hotbar.5 with minecraft:map[\
minecraft:item_name="{\"text\":\"Update Lighting\"}"]
clear @s[scores={ev_maps=1..}] minecraft:filled_map
scoreboard players set @s ev_maps 0

execute if entity @s[scores={cv_C=2}] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:light[level=2] replace minecraft:air
execute if entity @s[scores={cv_C=1}] run fill ~-12 ~-12 ~-12 ~12 ~12 ~12 minecraft:air replace minecraft:light

scoreboard players remove @s[scores={cv_C=1..}] cv_C 1

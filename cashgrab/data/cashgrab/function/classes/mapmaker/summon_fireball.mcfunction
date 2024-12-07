
execute if entity @a[tag=t_pm_owner,scores={ps_selected_hotbar_slot=5}] anchored eyes run summon minecraft:fireball ^ ^ ^1 {Motion:[0.0,0.0,0.0],ExplosionPower:6,Tags:["t_mapmaker_fireball_init"]}
execute if entity @a[tag=t_pm_owner,scores={ps_selected_hotbar_slot=6}] anchored eyes run summon minecraft:fireball ^ ^ ^1 {Motion:[0.0,0.0,0.0],ExplosionPower:3,Tags:["t_mapmaker_fireball_init"]}

function cashgrab:util/npe_calc_facing_vector {magnitude:3.0f}

execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] Motion[0] double 0.001 run scoreboard players get @s facing_vector_x_mm
execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] Motion[1] double 0.001 run scoreboard players get @s facing_vector_y_mm
execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] Motion[2] double 0.001 run scoreboard players get @s facing_vector_z_mm

#tellraw @a[tag=t_debug] [{"type":"text","text":"Fireball Motion = "},{"type":"nbt","source":"entity","entity":"@e[tag=t_mapmaker_fireball_init,limit=1]","nbt":"Motion"}]
#tellraw @a[tag=t_debug] [{"type":"text","text":"Facing Vector x = "},{"type":"score","score":{"name":"@s","objective":"facing_vector_x_mm"}},{"type":"text","text":" y = "},{"type":"score","score":{"name":"@s","objective":"facing_vector_y_mm"}},{"type":"text","text":" z = "},{"type":"score","score":{"name":"@s","objective":"facing_vector_z_mm"}}]

#execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] power[0] double 0.0001 run scoreboard players get @s facing_vector_x_mm
#execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] power[1] double 0.0001 run scoreboard players get @s facing_vector_y_mm
#execute store result entity @e[tag=t_mapmaker_fireball_init,limit=1] power[2] double 0.0001 run scoreboard players get @s facing_vector_z_mm

tag @e[tag=t_mapmaker_fireball_init,limit=1] remove t_mapmaker_fireball_init

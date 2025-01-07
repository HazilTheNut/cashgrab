# classes/dancer/dancer_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Dancer's Sforzando missile end function
#
# Arguments: 
#   end_reason: The reason this missile is being cleaned up

# Play sfx/vfx
particle minecraft:dust{color:[0.8f,0.4f,0.8f],scale:1.0} ~ ~ ~ 1.25 1.25 1.25 0 70
particle minecraft:gust ~ ~ ~ 0.5 0.25 0.5 0.1 10
playsound minecraft:entity.firework_rocket.twinkle player @a ~ ~ ~ 0.5 1.0

# Tag missile owner with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Tag relevant entities
tag @s add t_dmg_by
tag @a[tag=t_eid_matches,limit=1] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..3] add t_dmg_trgt

# Apply damage (dependent on stack sizes)
execute if score @a[tag=t_dmg_from,limit=1] cv_A matches 0 run function cashgrab:util/npe_dmg {\
d_dmg_amount:4.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1}

execute if score @a[tag=t_dmg_from,limit=1] cv_A matches 1 run function cashgrab:util/npe_dmg {\
d_dmg_amount:6.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1}

execute if score @a[tag=t_dmg_from,limit=1] cv_A matches 2 run function cashgrab:util/npe_dmg {\
d_dmg_amount:8.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1}

execute if score @a[tag=t_dmg_from,limit=1] cv_A matches 3 run function cashgrab:util/npe_dmg {\
d_dmg_amount:10.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1}

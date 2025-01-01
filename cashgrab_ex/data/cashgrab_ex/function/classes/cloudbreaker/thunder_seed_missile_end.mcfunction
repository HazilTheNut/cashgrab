# classes/cloudbreaker/thunder_seed_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Thunder Seed missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# vfx / sfx
execute positioned ~ ~6.5 ~ run particle minecraft:dust{color:[1.0f,1.0f,0.0f],scale:1.5} ~ ~ ~ 0.05 5 0.05 0 30 normal
execute positioned ~ ~6.5 ~ run particle minecraft:dust{color:[1.0f,1.0f,0.0f],scale:1.5} ~ ~ ~ 0.05 5 0.05 0 30 force
particle minecraft:explosion ~ ~ ~ 1.5 0.25 1.5 0 10 force
particle minecraft:lava ~ ~ ~ 1.5 0.25 1.5 0 10 normal
playsound minecraft:entity.lightning_bolt.impact player @a ~ ~ ~ 1.0 1.5

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Apply damage
tag @s add t_dmg_by
tag @a[tag=t_eid_matches] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..3.5] add t_dmg_trgt
function cashgrab:util/npe_dmg {\
d_dmg_amount:7.0,\
s_dmg_type:"minecraft:player_explosion",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}


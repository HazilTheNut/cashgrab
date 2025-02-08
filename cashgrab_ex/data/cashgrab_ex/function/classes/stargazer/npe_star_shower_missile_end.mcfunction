# classes/stargazer/npe_star_shower_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Star Shower missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# vfx / sfx
particle minecraft:dust{color:[1.0,1.0,0.7],scale:1.25} ~ ~ ~ 2 0.75 2 0.5 40 force
particle minecraft:electric_spark ~ ~ ~ 2 0.25 2 0 25
playsound minecraft:block.glass.break player @a ~ ~ ~ 0.25 2.0

# Find owner and tag with t_dmg_from
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches,limit=1] add t_dmg_from

# Apply damage in an area
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[distance=..4.5,tag=t_collision_candidate] add t_dmg_trgt
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:5.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

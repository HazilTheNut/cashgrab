# classes/stargazer/npe_astral_dart_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Astral Dart missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# vfx / sfx
particle minecraft:entity_effect{color:[0.36,0.80,0.97,1.0]} ~ ~ ~ 0.25 0.25 0.25 0.5 7

playsound minecraft:block.snow.break player @a ~ ~ ~ 0.75 2

$execute unless score NUM_END_REASON_ENTITY_COLLISION num matches $(end_reason) run return 0

# If missile hit an entity, damage them

# Find owner and tag with t_dmg_from
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches,limit=1] add t_dmg_from

# Apply damage
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:4.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

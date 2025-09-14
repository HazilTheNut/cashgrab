# trinkets/echo_bolt/npe_echo_bolt_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Echo Bolt missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# vfx / sfx
particle minecraft:block{block_state:"minecraft:cyan_glazed_terracotta"} ~ ~ ~ 0.3 0.3 0.3 0 15
playsound minecraft:block.ancient_debris.break player @a ~ ~ ~ 1.0 2.0

$execute unless score NUM_END_REASON_ENTITY_COLLISION num matches $(end_reason) run return 0

# If missile hit an entity, damage them

# Find owner and tag with t_dmg_from
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @a[tag=t_eid_matches,limit=1] add t_dmg_from

# Refund charge
scoreboard players set @a[tag=t_eid_matches,limit=1] trinket_charges_modify 1

# Apply damage
tag @s add t_dmg_by
effect give @e[tag=t_collision_found] minecraft:slowness 5 0
function cashgrab:util/npe_dmg {\
d_dmg_amount:6.0,\
s_dmg_type:"minecraft:player_attack",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# classes/vampire/vampire_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vampire's Soul Siphon missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Play particle effect, and then terminate function if this missile missed an entity.
particle explosion ~ ~ ~ 0.0 0.0 0.0 0 2
$execute unless score NUM_END_REASON_ENTITY_COLLISION num matches $(end_reason) run return 0

# Find owner and tag with t_missile_owner
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_missile_owner

# If missile hit, reduce cooldown by 3 seconds and damage target.
scoreboard players remove @a[tag=t_missile_owner,limit=1,scores={ability_cd_ms=3001..}] ability_cd_ms 3000
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:2.0,\
s_dmg_type:"cashgrab:dark_attack",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_missile_owner",\
b_remove_tags:0\
}

# Apply tag to denote that this player was struck by a missile
tag @a[tag=t_collision_found] add t_vampire_marked_target
tag @a[tag=t_missile_owner,limit=1] add t_vampire_mark_owner

# Mark player for 7 seconds and apply weakness.
function cg_maks:classes/vampire/npe_vampire_create_mark_timer

# Clean up tags
tag @e remove t_dmg_by
tag @a remove t_missile_owner
tag @a remove t_vampire_marked_target
tag @a remove t_vampire_mark_owner

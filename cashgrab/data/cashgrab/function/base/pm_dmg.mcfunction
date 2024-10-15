# base/pm_dmg.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Applies damage to owner player if tagged with t_dmg_target.
#
# Arguments:
#	d_dmg_amount		: Amount of damage dealt
#	s_dmg_type			: Resource locator to type of damage dealt
#	t_dmg_target		: Entities tagged with this will take damage
#	t_dmg_by			: Entity tagged with this is who/what dealt the damage
#	t_dmg_from			: Entity tagged with this is responsible for dealing the damage

# Find owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Damage owner if tagged with t_dmg_target
#$tellraw @a[tag=t_debug] "t_dmg_target = $(t_dmg_target); t_dmg_by = $(t_dmg_by); t_dmg_from = $(t_dmg_from)"
$damage @a[tag=t_eid_matches,tag=$(t_dmg_target),limit=1] $(d_dmg_amount) $(s_dmg_type) by @n[tag=$(t_dmg_by)] from @n[tag=$(t_dmg_from)]

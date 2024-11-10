# util/npe_dmg.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Applies damage to all entities tagged with t_dmg_target. Handles pm logic with players to correctly apply damage
#
# Note: calling this function overwrites t_eid_matches tags
#
# Arguments:
#	d_dmg_amount		: Amount of damage dealt
#	s_dmg_type			: Resource locator to type of damage dealt
#	t_dmg_target		: Entities tagged with this will take damage
#	t_dmg_by			: Entity tagged with this is who/what dealt the damage
#	t_dmg_from			: Entity tagged with this is responsible for dealing the damage
#	b_remove_tags		: If nonzero, remove t_dmg_target, t_dmg_by, and t_dmg_from tags afterwards

# Damage nonplayers tagged with t_dmg_target
$execute as @e[type=!minecraft:player,tag=$(t_dmg_target)] run damage @s $(d_dmg_amount) $(s_dmg_type) by @n[tag=$(t_dmg_by)] from @n[tag=$(t_dmg_from)]

# Damage players tagged with t_dmg_target
$execute as @e[tag=t_pm] run function cashgrab:base/pm_dmg {\
d_dmg_amount:$(d_dmg_amount),\
s_dmg_type:"$(s_dmg_type)",\
t_dmg_target:"$(t_dmg_target)",\
t_dmg_by:"$(t_dmg_by)",\
t_dmg_from:"$(t_dmg_from)"}

# Aftewards, clean up tags if b_remove_tags is nonzero
$execute if score NUM_ZERO num matches $(b_remove_tags) run return 0
$tag @e remove $(t_dmg_target)
$tag @a remove $(t_dmg_target)
$tag @e remove $(t_dmg_by)
$tag @a remove $(t_dmg_by)
$tag @e remove $(t_dmg_from)
$tag @a remove $(t_dmg_from)

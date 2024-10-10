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
#	t_dmg_source		: Entity tagged with this is responsible for dealing the damage
#	t_dmg_origin		: Entity tagged with this is from where the damage was dealt
#	b_remove_tags		: If nonzero, remove t_dmg_target, t_dmg_source, and t_dmg_origin tags afterwards

# Damage nonplayers tagged with t_dmg_target
$execute as @e[type=!minecraft:player,tag=$(t_dmg_target)] run damage @s $(d_dmg_amount) $(s_dmg_type) by @n[tag=$(t_dmg_source)] from @n[tag=$(t_dmg_origin)]

# Damage players tagged with t_dmg_target
execute as @e[tag=t_pm] run say hi
$execute as @e[tag=t_pm] run function cashgrab:base/pm_dmg {\
d_dmg_amount:$(d_dmg_amount),\
s_dmg_type:"$(s_dmg_type)",\
t_dmg_target:"$(t_dmg_target)",\
t_dmg_source:"$(t_dmg_source)",\
t_dmg_origin:"$(t_dmg_origin)"}

# Aftewards, clean up tags if b_remove_tags is nonzero
$execute if score NUM_ZERO num matches $(b_remove_tags) run return 0
$tag @e remove $(t_dmg_target)
$tag @e remove $(t_dmg_source)
$tag @e remove $(t_dmg_origin)

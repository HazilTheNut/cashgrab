# classes/test_b/missile_end_dmg.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: test class b's missile end function
#
# Arguments: (none)

execute as @e[tag=t_collision_found] at @s run particle crit ~ ~ ~ 0.25 1 0.25 0 200

#function coinwars:util/pe_eid_find_owner

#damage @e[tag=t_collision_found,limit=1,sort=nearest] 0.1 minecraft:in_fire by @s from @e[scores={eid_state=1..,eid_compare=0},limit=1]

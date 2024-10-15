# classes/champion/pm_set_absorption_timer.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Sets absorption timer for owner of pm if owner has tag t_champion_set_absorption_timer
#
# Arguments: (none)

# Find owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

execute unless entity @a[tag=t_eid_matches,limit=1,tag=t_champion_set_absorption_timer] run return 0

# If owner has tag, set timer
execute at @a[tag=t_eid_matches,limit=1] run particle minecraft:crit ~ ~0.4 ~ 1.25 1.0 1.25 0 50
execute at @a[tag=t_eid_matches,limit=1] run function cashgrab:util/npe_set_timer {\
lifetime_ticks:80,\
b_anchor_at_pos:0,\
t_timer_name:"t_champion_absorption_timer_init",\
func_step:"cashgrab:classes/champion/npe_absorption_particle_timer_step",\
func_end:"cashgrab:util/dummy",\
b_assign_as_peer:1,\
}

tag @e[tag=t_champion_absorption_timer_init] add t_stasis_immune
tag @e[tag=t_champion_absorption_timer_init] add t_champion_absorption_timer
tag @e[tag=t_champion_absorption_timer_init] remove t_champion_absorption_timer_init

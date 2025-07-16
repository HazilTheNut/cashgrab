# classes/titan/pm_set_power_strike_timer.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Sets power strike knockback timer for owner of pm if owner has tag t_titan_set_power_strike_timer
#
# Arguments: (none)

# Find owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

execute unless entity @a[tag=t_eid_matches,limit=1,tag=t_titan_set_power_strike_timer] run return 0

# If owner has tag, set timer
execute at @a[tag=t_eid_matches,limit=1] run particle minecraft:crit ~ ~0.4 ~ 1.25 1.0 1.25 0 50
execute at @a[tag=t_eid_matches,limit=1] run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:200,\
b_anchor_at_pos:0,\
t_timer_name:"t_titan_power_strike_knockback_tmr_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/titan/power_strike_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# base/timer_main.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Top-level main function for timers
#
# Arguments: (none)

scoreboard players remove @s[scores={stasis_state=-1..0}] tmr_lifetime_ticks 1

# Self-destruct if tagged for cleanup
execute if entity @s[tag=t_cleanup] run return run function cashgrab:base/timer_end_cleanup with entity @s data

# If not anchored at creation position
execute if entity @s[scores={tmr_anchor_pos=0}] run function cashgrab:base/timer_at_owner with entity @s data

# If anchored at creation position
execute if entity @s[scores={tmr_anchor_pos=1..}] run function cashgrab:base/timer_at_self with entity @s data

# Cleanup when timer expires
execute unless entity @s[scores={tmr_lifetime_ticks=..0}] run return 0
function cashgrab:base/npe_cleanup {b_self_destruct:0}
scoreboard players reset @s
kill @s

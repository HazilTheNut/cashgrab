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

# Self-destruct if cleaned up
execute if entity @s[tag=t_cleanup] run scoreboard players set @s tmr_lifetime_ticks 0

# If not anchored at creation position
execute if entity @s[scores={tmr_anchor_pos=0}] run function cashgrab:base/timer_at_owner with entity @s data

# If anchored at creation position
execute if entity @s[scores={tmr_anchor_pos=1..}] run function cashgrab:base/timer_at_self with entity @s data

# Cleanup
tag @s[scores={tmr_lifetime_ticks=..0}] add t_kill
scoreboard players reset @s[tag=t_kill]
kill @s[tag=t_kill]

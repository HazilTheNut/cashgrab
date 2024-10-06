# base/timer_operate.mcfunction
#
# Context:
#	as: a timer marker
#	at: the entity
#
# Summary: Runs the timer
#
# Arguments:
#	func_step		: Function to run every tick
#	func_end		: Function to run when the timer expires
#						func_end is supplied with an end_reason argument based on why func_end was called: 0 = cleaned up, 1 = timer expired

scoreboard players remove @s[scores={stasis_state=-1..0}] tmr_lifetime_ticks 1

# Self-destruct if cleaned up
execute if entity @s[tag=t_cleanup] run scoreboard players set @s tmr_lifetime_ticks 0

# If not anchored at creation position
execute if entity @s[scores={tmr_anchor_pos=0}] run function cashgrab:util/npe_eid_find_owner
$execute if entity @s[scores={tmr_anchor_pos=0,tmr_lifetime_ticks=1..}] at @e[scores={eid_compare=0}] run function $(func_step)
$execute if entity @s[scores={tmr_anchor_pos=0,tmr_lifetime_ticks=..0},tag=t_cleanup] at @e[scores={eid_compare=0}] run function $(func_end) {end_reason:0}
$execute if entity @s[scores={tmr_anchor_pos=0,tmr_lifetime_ticks=..0},tag=!t_cleanup] at @e[scores={eid_compare=0}] run function $(func_end) {end_reason:1}

tag @s[scores={tmr_anchor_pos=0,tmr_lifetime_ticks=..0}] add t_kill
scoreboard players reset @s[tag=t_kill]
kill @s[tag=t_kill]
execute if entity @s[tag=t_kill] run return 0

execute if score @s tmr_anchor_pos matches 0 run return 0

# If anchored at creation position
$execute if entity @s[scores={tmr_lifetime_ticks=1..}] run function $(func_step)
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=t_cleanup] run function $(func_end) {end_reason:0}
$execute if entity @s[scores={tmr_lifetime_ticks=..0},tag=!t_cleanup] run function $(func_end) {end_reason:1}
tag @s[scores={tmr_lifetime_ticks=..0}] add t_kill
scoreboard players reset @s[tag=t_kill]
kill @s[tag=t_kill]

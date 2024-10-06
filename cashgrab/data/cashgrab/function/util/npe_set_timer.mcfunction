# util/npe_set_timer.mcfunction
#
# Context:
#	as: an entity with a valid EID
#	at: the entity
#
# Summary: Runs the timer
#
# Arguments:
#	lifetime_ticks	: Duration of timer, in ticks
#	b_anchor_at_pos	: If nonzero, causes the timer to run func_step and func_end at the location where the timer was created.
#						Otherwise, func_step and func_end are ran at the timer creator's location
#	t_timer_name	: Tag to give to the timer to identify its type
#	func_step		: Function to run every tick
#	func_end		: Function to run when the timer expires
#						func_end is supplied with an end_reason argument based on why func_end was called: 0 = cleaned up, 1 = timer expired

$summon minecraft:marker ~ ~ ~ {data:{func_step:"$(func_step)",func_end:"$(func_end)"},Tags:["t_timer_init"]}

execute as @e[type=minecraft:marker,limit=1,tag=t_timer_init] run function coinwars:util/pe_eid_acquire

scoreboard players operation @e[type=minecraft:marker,limit=1,tag=t_timer_init] team_id = @s team_id
scoreboard players operation @e[type=minecraft:marker,limit=1,tag=t_timer_init] eid_owner = @s eid_self
$scoreboard players set @e[type=minecraft:marker,limit=1,tag=t_timer_init] tmr_lifetime_ticks $(lifetime_ticks)
$scoreboard players set @e[type=minecraft:marker,limit=1,tag=t_timer_init] tmr_anchor_pos $(b_anchor_at_pos)

$tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] add $(t_timer_name)
tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] add t_timer
tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] remove t_timer_init

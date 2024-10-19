# util/npe_set_timer.mcfunction
#
# Context:
#	as: an entity with a valid EID
#	at: the entity
#
# Summary: Runs the timer
#
# Arguments:
#	lifetime_ticks		: Duration of timer, in ticks
#	b_anchor_at_pos		: If nonzero, causes the timer to run func_npe_step and func_npe_end at the location where the timer was created.
#							Otherwise, func_npe_step and func_npe_end are ran at the timer creator's location
#	t_timer_name		: Tag to give to the timer to identify its type
#	func_npe_start		: Function to run when timer begins
#	func_npe_step		: Function to run every tick
#	func_npe_end		: Function to run when the timer expires
#							func_npe_end is supplied with an end_reason argument based on why func_npe_end was called: 0 = cleaned up, 1 = timer expired
#	b_assign_as_peer	: Set to nonzero to assign eid_owner to missile to be a peer to the executor rather than owned by them. 
#							Useful for pms that call this function.

$summon minecraft:marker ~ ~ ~ {data:{func_npe_step:"$(func_npe_step)",func_npe_end:"$(func_npe_end)"},Tags:["t_timer_init"]}

execute as @e[type=minecraft:marker,limit=1,tag=t_timer_init] run function cashgrab:util/npe_eid_acquire

scoreboard players operation @e[type=minecraft:marker,limit=1,tag=t_timer_init] team_id = @s team_id
$execute if score NUM_ZERO num matches $(b_assign_as_peer) run scoreboard players operation @e[type=minecraft:marker,limit=1,tag=t_timer_init] eid_owner = @s eid_self
$execute unless score NUM_ZERO num matches $(b_assign_as_peer) run scoreboard players operation @e[type=minecraft:marker,limit=1,tag=t_timer_init] eid_owner = @s eid_owner
$scoreboard players set @e[type=minecraft:marker,limit=1,tag=t_timer_init] tmr_lifetime_ticks $(lifetime_ticks)
$scoreboard players set @e[type=minecraft:marker,limit=1,tag=t_timer_init] tmr_anchor_pos $(b_anchor_at_pos)

$tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] add $(t_timer_name)
tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] add t_timer

$execute as @e[type=minecraft:marker,limit=1,tag=t_timer_init] run function cashgrab:base/timer_start {func_npe_start:"$(func_npe_start)"}

tag @e[type=minecraft:marker,limit=1,tag=t_timer_init] remove t_timer_init

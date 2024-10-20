# trinkets/accelerator/accelerator_timer_end.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#	+ the owner of the timer is tagged with t_timer_owner
#
# Summary: End of Accelerator effect
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = timer expired)

# If the timer was not cleaned up, play a sound to notify user the effect has ended
$execute unless score NUM_ZERO num matches $(end_reason) run playsound minecraft:block.beacon.power_select player @a[tag=t_timer_owner,limit=1] ~ ~ ~ 1.0 1.0

scoreboard players remove @a[tag=t_timer_owner,limit=1] ability_cd_tickrate 100

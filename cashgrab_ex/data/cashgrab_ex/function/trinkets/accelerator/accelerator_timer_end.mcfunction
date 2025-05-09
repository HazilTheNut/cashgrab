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
#	end_reason	: The reason for why the end function was called

# If the timer expired, notifuy user in text chat
$execute if score NUM_END_REASON_EXPIRE num matches $(end_reason) run tellraw @a[tag=t_eid_matches,limit=1] {color:"green","type":text,text:"The Accelerator's effect has worn off"}

# If the timer expired, play a sound to notify user the effect has ended
$execute if score NUM_END_REASON_EXPIRE num matches $(end_reason) run playsound minecraft:block.beacon.power_select player @a[tag=t_timer_owner,limit=1] ~ ~ ~ 1.0 1.0

# Decrease cooldown speed
scoreboard players remove @a[tag=t_timer_owner,limit=1] ability_cd_tickrate 100

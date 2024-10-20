# trinkets/accelerator/accelerator_timer_start.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#	+ the owner of the timer is tagged with t_timer_owner
#
# Summary: Start of Accelerator effect
#
# Arguments: (none)

playsound minecraft:block.beacon.power_select player @a[tag=t_timer_owner,limit=1] ~ ~ ~ 1.0 2.0
scoreboard players add @a[tag=t_timer_owner,limit=1] ability_cd_tickrate 100

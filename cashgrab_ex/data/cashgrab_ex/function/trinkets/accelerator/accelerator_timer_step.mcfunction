# trinkets/accelerator/accelerator_timer_step.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#	+ the owner of the timer is tagged with t_timer_owner
#
# Summary: Step function of Accelerator effect
#
# Arguments: (none)

particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.0} ~ ~1 ~ 0.15 0.35 0.15 0 3 force

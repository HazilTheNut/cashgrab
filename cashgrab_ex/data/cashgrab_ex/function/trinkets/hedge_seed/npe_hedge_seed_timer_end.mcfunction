# trinkets/hedge_seed/npe_hedge_seed_timer_end.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#
# Summary: End function of Hedge Seed timer
#
# Arguments: 
#	end_reason	: The reason for why the end function was called

# If wall did not form, do nothing
execute if score @s tv_B matches ..0 run return 0

# Destroy wall
execute store result storage cashgrab_ex:hedge_args height int 1 run scoreboard players get @s tv_C
function cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_timer_destroy with storage cashgrab_ex:hedge_args

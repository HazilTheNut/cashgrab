# trinkets/risk_it_biscuit/npe_risk_it_biscuit_effect_timer_score_kill.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Risk-It Biscuit timer kill scoring function, handles granting regeneration
#
# Arguments: (none)

# Give slow falling effect if player jumps
effect give @a[tag=t_player_owner,limit=1] minecraft:regeneration 4 3

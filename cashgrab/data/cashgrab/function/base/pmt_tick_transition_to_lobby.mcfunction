# base/pmt_tick_transition_to_lobby.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Transition to In Pregame Lobby activity_state
#
# Arguments: (none)

clear @a[tag=t_pm_owner,limit=1]
function cashgrab:util/pmt_inv_refresh

# Move to In Pregame Lobby activity_state
scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 1

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

effect clear @a[tag=t_pm_owner,limit=1]

# Set player gamemode
execute if score DEVELOPER_MODE num matches 0 run gamemode adventure @a[tag=t_pm_owner,limit=1]

# Set maximum locator bar waypoint distance
attribute @a[tag=t_player_initialize,limit=1] minecraft:waypoint_transmit_range base set 500

# Move player team
team join team_lobby @a[tag=t_pm_owner,limit=1]

# Move to In Pregame Lobby activity_state
scoreboard players set @a[tag=t_pm_owner,limit=1] activity_state 1

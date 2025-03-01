# base/pmt_tick_lobby.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for In Pregame Lobby activity_state
#
# Arguments: (none)

# Run toss ability code
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_ability

# Play Tutorial book item
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evc_books=1..}] activity_state 30
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_books 0

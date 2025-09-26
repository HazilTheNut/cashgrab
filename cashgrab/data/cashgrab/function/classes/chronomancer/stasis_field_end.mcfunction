# classes/chronomancer/stasis_field_end.mcfunction
#
# Context:
#	as: a Stasis Field timer
#	at: the timer
#
# Summary: Chronomancer's stasis field end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	state value if player is in a Stasis Field
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 2

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Re-enable Stasis Field ability for owner and initiate cooldown
scoreboard players set @a[tag=t_eid_matches] ability_cfg_cd_ms 10000
scoreboard players set @a[tag=t_eid_matches] ability_cd_ms 10000
scoreboard players set @a[tag=t_eid_matches] ability_charges 0
scoreboard players set @a[tag=t_eid_matches] cv_E 0

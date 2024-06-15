# classes/chronomancer/stasis_field_end.mcfunction
#
# Context:
#	as: a Stasis Field timer
#	at: the timer
#
# Summary: Chronomancer's stasis field end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 2

# Re-enable Stasis Field ability for owner and initiate cooldown
function coinwars:util/pe_eid_find_owner
scoreboard players set @a[scores={eid_compare=0}] ability_cfg_cooldown_ticks 200
scoreboard players set @a[scores={eid_compare=0}] ability_cd_ticks 200
scoreboard players set @a[scores={eid_compare=0}] ability_charges 0
scoreboard players set @a[scores={eid_compare=0}] cv_E 0

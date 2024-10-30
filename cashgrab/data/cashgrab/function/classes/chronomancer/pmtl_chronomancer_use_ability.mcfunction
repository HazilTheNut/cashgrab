# classes/chronomancer/pmtl_chronomancer_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	state value if player is in a Stasis Field
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# If stasis field active, end it instead
function cashgrab:util/npe_eid_find_peers
execute if entity @e[tag=t_stasis_field,scores={eid_compare=0}] run tag @e[tag=t_stasis_field,scores={eid_compare=0}] add t_cleanup
execute if entity @e[tag=t_stasis_field,scores={eid_compare=0}] run return 0

playsound minecraft:block.beacon.deactivate player @a ~ ~ ~ 1 2

# Create Stasis Field
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
lifetime_ticks:140,\
b_anchor_at_pos:1,\
t_timer_name:"t_stasis_field_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/chronomancer/stasis_field_tick",\
func_npe_end:"cashgrab:classes/chronomancer/stasis_field_end",\
b_assign_as_peer:1,\
}

tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] add t_stasis_immune
tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] add t_stasis_field
tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] remove t_stasis_field_init

# Switch ability to Cancel Stasis Field
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 1000

# Store existence of Stasis Field for display purposes
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 1

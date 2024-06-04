# classes/chronomancer/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 10
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# If stasis field active, end it instead
function coinwars:util/pe_eid_find_subs
execute if entity @e[tag=t_stasis_field,scores={eid_compare=0}] run tag @e[tag=t_stasis_field,scores={eid_compare=0}] add t_cleanup
execute if entity @e[tag=t_stasis_field,scores={eid_compare=0}] run return 0

playsound minecraft:block.beacon.deactivate player @a ~ ~ ~ 1 2

# Create Stasis Field
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function coinwars:util/pe_set_timer {\
lifetime_ticks:200,\
b_anchor_at_pos:1,\
t_timer_name:"t_stasis_field_init",\
func_step:"coinwars:classes/chronomancer/stasis_field_step",\
func_end:"coinwars:classes/chronomancer/stasis_field_end"\
}

tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] add t_stasis_immune
tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] add t_stasis_field
tag @e[tag=t_stasis_field_init,limit=1,sort=nearest] remove t_stasis_field_init

# Switch ability to cancel
scoreboard players set @s ability_cfg_cooldown_ticks 20

# Store existence of Stasis Field for display purposes
scoreboard players set @s cv_E 1

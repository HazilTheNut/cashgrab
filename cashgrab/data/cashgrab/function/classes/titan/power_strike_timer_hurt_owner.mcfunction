# classes/titan/power_strike_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Titan's Power Strike knockback effect timer tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:cloud ~ ~0.5 ~ 0.75 0.75 0.75 0 30
playsound minecraft:block.grass.break player @a ~ ~ ~ 1.0 0.5
effect give @e[tag=t_timer_owner] minecraft:slowness 3 2

# Apply damage
tag @s add t_dmg_by
tag @e[tag=t_timer_owner] add t_dmg_trgt
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s cv_D
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
function cashgrab:util/npe_dmg {\
d_dmg_amount:4.0,\
s_dmg_type:"cashgrab:kinetic_combo",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_eid_matches",\
b_remove_tags:1\
}

# Clean up
tag @s add t_cleanup

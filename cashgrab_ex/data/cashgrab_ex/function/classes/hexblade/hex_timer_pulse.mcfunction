# classes/hexblade/hex_timer_pulse.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier damage pulse
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Hex timer damage sourcing pointer (to Hexblade that bestowed it)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# vfx / sfx
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1.0 2.0
particle minecraft:dust{color:[1.0f,0.2f,0.5f],scale:1.0} ~ ~1.75 ~ 0.2 1.2 0.2 0 40

# Find owner and tag them with t_dmg_trgt
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches] add t_dmg_trgt

# Find Hexblade source and tag them with t_dmg_from
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s cv_A
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches] add t_dmg_from

# Apply damage
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:2.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

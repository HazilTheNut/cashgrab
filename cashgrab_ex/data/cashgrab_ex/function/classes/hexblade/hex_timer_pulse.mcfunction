# classes/hexblade/hex_timer_pulse.mcfunction
#
# Context:
#	as: a Hex timer
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Pulse effect of Hexblade Hex
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# Find Hex originator and tag with t_hexblade_hex_originator
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_hexblade_hex_originator

# vfx / sfx
execute at @n[tag=t_timer_owner] run playsound minecraft:entity.wither.hurt player @a ~ ~ ~ 0.35 0.6
execute at @n[tag=t_timer_owner] run playsound minecraft:entity.wither.hurt player @a[tag=t_hexblade_hex_originator,limit=1] ~ ~ ~ 0.35 0.6 0.35
execute at @n[tag=t_timer_owner] run particle minecraft:dust{color:[1.0f,0.2f,0.5f],scale:1.0} ~ ~1.75 ~ 0.2 1.2 0.2 0 40

# Apply damage
tag @e[tag=t_timer_owner] add t_dmg_trgt
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:2.0,\
s_dmg_type:"cashgrab:dark_attack",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_hexblade_hex_originator",\
b_remove_tags:1\
}

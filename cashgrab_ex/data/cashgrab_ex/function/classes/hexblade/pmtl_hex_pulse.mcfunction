# classes/hexblade/pmtl_hex_pulse.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	+ the target of the hex is tagged with t_hex_target
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Pulse effect of Hexblade Hex
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# vfx / sfx
execute at @n[tag=t_hex_target] run playsound minecraft:entity.wither.hurt player @a ~ ~ ~ 0.35 0.6
execute at @n[tag=t_hex_target] run playsound minecraft:entity.wither.hurt player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.35 0.6 0.35
execute at @n[tag=t_hex_target] run particle minecraft:dust{color:[1.0f,0.2f,0.5f],scale:1.0} ~ ~1.75 ~ 0.2 1.2 0.2 0 40

# Apply damage
tag @e[tag=t_hex_target] add t_dmg_trgt
tag @s add t_dmg_by
tag @e[tag=t_pm_owner] add t_dmg_from
function cashgrab:util/npe_dmg {\
d_dmg_amount:2.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# classes/hexblade/hex_missile_end_entity_hit.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hexblade's Hex missile end function when hitting a target
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

# Tag target of hex (who currently has t_collision_found)
tag @n[tag=t_collision_found] add t_hexblade_apply_hex

# Find owner and tag with t_hexblade_hex_originator
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_hexblade_hex_originator

# vfx / sfx
execute at @n[tag=t_hexblade_apply_hex] run playsound minecraft:entity.wither.hurt player @a ~ ~ ~ 0.35 0.6
execute at @n[tag=t_hexblade_apply_hex] run playsound minecraft:entity.wither.hurt player @a[tag=t_hexblade_hex_originator,limit=1] ~ ~ ~ 0.35 0.6 0.35
execute at @n[tag=t_hexblade_apply_hex] run particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~1.25 ~ 0.35 1.0 0.35 0 40

# Destroy previous Hex timer if it exists
execute store result storage cashgrab_ex:hexblade_eid_args hexblade_eid int 1 run scoreboard players get @a[tag=t_hexblade_hex_originator,limit=1] eid_self
function cashgrab_ex:classes/hexblade/npe_destroy_hex_timer with storage cashgrab_ex:hexblade_eid_args

# If owner was counting down Blight Step, reset count
scoreboard players set @a[tag=t_hexblade_hex_originator,limit=1,scores={cv_D=1..}] cv_D 20

# Apply Hex timer conditionally dependent on whether the target is a player or npe
execute if entity @a[tag=t_hexblade_apply_hex] as @e[tag=t_pm] run function cashgrab_ex:classes/hexblade/pm_apply_hex_timer
execute if entity @e[tag=t_hexblade_apply_hex,type=!minecraft:player] as @n[tag=t_hexblade_apply_hex] run function cashgrab_ex:classes/hexblade/npe_apply_hex_timer

# Apply damage
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:3.0,\
s_dmg_type:"minecraft:indirect_magic",\
t_dmg_target:"t_hexblade_apply_hex",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_hexblade_hex_originator",\
b_remove_tags:1\
}

# classes/hexblade/hex_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hexblade's Hex missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

# Only do below if missile hit an entity
execute unless score @s temp_A matches 2 run return 0

# Find owner and tag with t_missile_owner
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_missile_owner

# Get previous target of Hex (if they exist) and remove glowing effect
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @e[tag=t_missile_owner,limit=1] cv_A
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
effect clear @e[tag=t_eid_matches] minecraft:glowing

# Entity hit should already be tagged with t_collision_found which we'll reuse that tag

# Apply glowing to target of Hex
effect give @n[tag=t_collision_found] minecraft:glowing 11 0

# vfx / sfx
execute at @n[tag=t_collision_found] run playsound minecraft:entity.wither.hurt player @a ~ ~ ~ 0.35 0.6
execute at @n[tag=t_collision_found] run playsound minecraft:entity.wither.hurt player @a[tag=t_missile_owner,limit=1] ~ ~ ~ 0.35 0.6 0.35
execute at @n[tag=t_collision_found] run particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~1.25 ~ 0.35 1.0 0.35 0 40

# Point Hexblade Hex target to entity hit by missile
scoreboard players operation @e[tag=t_missile_owner,limit=1] cv_A = @n[tag=t_collision_found] eid_self

# Initiate Hex sequence timer
scoreboard players set @e[tag=t_missile_owner,limit=1] cv_B 220

# Apply damage
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:4.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_missile_owner",\
b_remove_tags:1\
}

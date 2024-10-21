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
#	cv_A	:	Hex timer damage sourcing pointer (to Hexblade that bestowed it)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

# Only do below if missile hit an entity
execute unless score @s temp_A matches 2 run return 0

# Find owner and tag with t_eid_matches
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args

# Entity hit should already be tagged with t_collision_found which we'll reuse that tag

effect give @e[tag=t_collision_found] minecraft:glowing 8 0

# Create Hex timer owned by target hit by missile
function cashgrab:util/npe_set_timer {\
lifetime_ticks:151,\
b_anchor_at_pos:0,\
t_timer_name:"t_hex_timer_init",\
func_npe_start:"cashgrab:util/dummy",\
func_npe_step:"cashgrab_ex:classes/hexblade/hex_timer_step",\
func_npe_end:"cashgrab_ex:classes/hexblade/hex_timer_end",\
b_assign_as_peer:0,\
}
# Ownership of the timer is given to the target so that the Hex effect cleans up when they do (e.g. when they die)
scoreboard players operation @n[tag=t_hex_timer_init] eid_owner = @n[tag=t_collision_found] eid_self
scoreboard players operation @n[tag=t_hex_timer_init] cv_A = @s eid_owner
tag @n[tag=t_hex_timer_init] add t_hex_timer
tag @n[tag=t_hex_timer_init] remove t_hex_timer_init

# Apply damage
tag @e[tag=t_eid_matches,limit=1] add t_dmg_from
tag @s add t_dmg_by
function cashgrab:util/npe_dmg {\
d_dmg_amount:3.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}

# classes/hexblade/pmtl_hexblade_create_remnant_at_hex_target.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	+ the target of the hex is tagged with t_hex_target
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Equips the Hexblade class onto the command executor
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

# Set timer
execute at @e[tag=t_hex_target,limit=1] rotated as @e[tag=t_hex_target,limit=1] run function cashgrab:util/npe_create_timer {\
lifetime_ticks:100,\
b_anchor_at_pos:1,\
t_timer_name:"t_hexblade_remnant_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/hexblade/hex_remnant_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# Point Hexblade Hex target to timer
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_A = @n[tag=t_hexblade_remnant_timer_init] eid_self
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 100
tag @e[tag=t_hex_target] remove t_hex_target
tag @n[tag=t_hexblade_remnant_timer_init] add t_hex_target
tag @n[tag=t_hexblade_remnant_timer_init] add t_hexblade_remnant_timer
tag @n[tag=t_hexblade_remnant_timer_init] add t_stasis_immune
tag @n[tag=t_hexblade_remnant_timer_init] remove t_hexblade_remnant_timer_init

# classes/hexblade/hex_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#   rotated: as the timer's owner
#
# Summary: Hexblade's Hex timer end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# Remove glowing effect from owner
effect clear @e[tag=t_timer_owner] minecraft:glowing

# If this timer expired, nullify Hex originator's Hex target pointer
$execute if score NUM_END_REASON_EXPIRE num matches $(end_reason) store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
$execute if score NUM_END_REASON_EXPIRE num matches $(end_reason) run function cashgrab:util/find_eid_self with storage cashgrab:eid_args
$execute if score NUM_END_REASON_EXPIRE num matches $(end_reason) run scoreboard players set @a[tag=t_eid_matches] cv_A 0

# Check if owner died
$execute unless score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# Below is ran when cleanup occurred from owner dying

# Create remnant timer
tellraw @a[tag=debug] "classes/hexblade/hex_timer_end: Creating remnant"

function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:160,\
b_anchor_at_pos:1,\
t_timer_name:"t_hexblade_remnant_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/hexblade/hex_remnant_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:0,\
}

# Set Hexblade Hex originator as owner of remnant (this Hex timer is owned by the Hex target)
scoreboard players operation @n[tag=t_hexblade_remnant_timer_init] eid_owner = @s cv_B

# Set Hexblade Hex originator to target the remnant timer
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
scoreboard players operation @a[tag=t_eid_matches,limit=1] cv_A = @n[tag=t_hexblade_remnant_timer_init] eid_self

# Notify Hex originator by text chat
tellraw @a[tag=t_eid_matches,limit=1] [{"color":"green","type":"text","text":"Your "},{"color":"yellow","type":"text","text":"Hexed"},{"color":"green","type":"text","text":" target has died! You can use "},{"color":"yellow","type":"text","text":"Blight Step"},{"color":"green","type":"text","text":" to teleport to their remains"}]

# Clean up tags
tag @n[tag=t_hexblade_remnant_timer_init] add t_hexblade_remnant_timer
tag @n[tag=t_hexblade_remnant_timer_init] add t_stasis_immune
tag @n[tag=t_hexblade_remnant_timer_init] remove t_hexblade_remnant_timer_init

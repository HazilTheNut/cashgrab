# classes/hexblade/pmtl_hexblade_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Hexblade class
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

# --- Hex

# Get target of hex
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_A
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches,limit=1] add t_hex_target
tag @a[tag=t_eid_matches,limit=1] add t_hex_target

# Update cv_E (hex target existence)
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 0
execute if entity @e[tag=t_hex_target] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 1
execute if entity @a[tag=t_hex_target] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 1

# Update cv_F (hex target existence state)
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=1,cv_F=2}] cv_F 1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=1,cv_F=-1..0}] cv_F 2
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=0,cv_F=-1}] cv_F 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=0,cv_F=1..2}] cv_F -1

# --- Blight Step

# Update inventory display when cv_E transitions between true and false
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches -1 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 2 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# Start Blight Step countdown
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=0,ps_sneaking=1..2}] cv_D 20

# Reset Blight Step countdown if target is invalid
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=0}] cv_D 0

# Reset Blight Step countdown if you cease to be crouching
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_E=1,ps_sneaking=-1,cv_D=1..}] cv_D 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1,ps_sneaking=-1}] run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# Blight Step countdown
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_D=1..}] cv_D 1

# Update inventory display
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 1..20 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# At Blight Step countdown = 1, teleport to target and consume hex
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=1}] run function cashgrab_ex:classes/hexblade/pmtl_hexblade_teleport_to_hex_target

# Remove t_hex_target tag now that we are done processing a tick
tag @e remove t_hex_target

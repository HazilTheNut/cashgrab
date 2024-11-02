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
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# --- Hex

# Get target of hex
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_A
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @e[tag=t_eid_matches,limit=1] add t_hex_target
tag @a[tag=t_eid_matches,limit=1] add t_hex_target

# If target does not exist, set pointer to null
execute unless entity @e[tag=t_hex_target] unless entity @a[tag=t_hex_target] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute unless entity @e[tag=t_hex_target] unless entity @a[tag=t_hex_target] run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# If target is a player that has died, place a "remnant" timer the Hexblade can teleport to
execute if entity @a[tag=t_hex_target,scores={evl_death=1..}] run function cashgrab_ex:classes/hexblade/pmtl_hexblade_create_remnant_at_hex_target

# If target is a player that is not in Gameplay state, set pointer to null
execute if entity @a[tag=t_hex_target,scores={activity_state=0..19}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute if entity @a[tag=t_hex_target,scores={activity_state=0..19}] run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# If no Hex target, end Hex sequence early
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0,cv_B=1..}] run tag @e remove t_hex_target
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0,cv_B=1..}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0

# Decrement Hex sequence timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_B=1..}] cv_B 1

# Start of hex sequence, update inventory display
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 219 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# Display particles at hex target (other than remnant)
execute at @e[tag=t_hex_target,tag=!t_hexblade_remnant_timer] run particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~2.5 ~ 0.1 0.1 0.1 0 1

# Pulse every 3 seconds if afflicting a mob
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 160 if entity @e[tag=t_hex_target,tag=!t_hexblade_remnant_timer] run function cashgrab_ex:classes/hexblade/pmtl_hex_pulse
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 100 if entity @e[tag=t_hex_target,tag=!t_hexblade_remnant_timer] run function cashgrab_ex:classes/hexblade/pmtl_hex_pulse
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 40 if entity @e[tag=t_hex_target,tag=!t_hexblade_remnant_timer] run function cashgrab_ex:classes/hexblade/pmtl_hex_pulse

# If a pulse caused a player death, create the remnant timer
execute if entity @a[tag=t_hex_target,scores={evl_death=1..}] run function cashgrab_ex:classes/hexblade/pmtl_hexblade_create_remnant_at_hex_target

# End of Hex sequence
effect clear @a[tag=t_pm_owner,limit=1,scores={cv_B=1}] minecraft:glowing
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_B=1}] cv_A 0
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# --- Blight Step

# Start Blight Step countdown
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=0,ps_sneaking=1..2}] cv_D 30

# Reset Blight Step countdown if target is invalid
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=0}] cv_D 0

# Reset Blight Step countdown if you cease to be crouching
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,ps_sneaking=..0,cv_D=1..}] cv_D 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,ps_sneaking=..0}] run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# Blight Step countdown
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_D=1..}] cv_D 1

# Update inventory display
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 1..30 run function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# At Blight Step countdown = 1, teleport to target and consume hex
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_D=1}] run function cashgrab_ex:classes/hexblade/pmtl_hexblade_teleport_to_hex_target

# Remove t_hex_target tag now that we are done processing a tick
tag @e remove t_hex_target

# classes/cloudbreaker/pmtl_cloudbreaker_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Cloudbreaker class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Nimbus Stride duration remaining, in ticks
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Thunder Seed charge
#	cv_F	:	Thunder Seed cooldown, in ms
#	cv_G	:	
#	cv_H	:	

# --- Nimbus Stride

# Create cloud blocks beneath if during Nimbus Stride
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_blocks

# Find cloud timers near player and reset their lifetimes
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run function cashgrab:util/npe_eid_find_peers
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run scoreboard players set @e[tag=t_cloudbreaker_cloud,scores={eid_compare=0},distance=..2] tmr_lifetime_ticks 3

# Tick down Nimbus Stride
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] cv_A 1

# Nimbus Stride vfx


# --- Thunder Seed

# Use Thunder Seed
execute if score @a[tag=t_pm_owner,limit=1] evc_torchflower_seeds matches 1.. run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.615f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:25,\
i_gravity_vy_mmpt:250,\
i_gravity_const_mmpt2:55,\
t_missile_name:"t_cloudbreaker_thunder_seed_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/cloudbreaker/thunder_seed_missile_tick",\
func_npe_end:"cashgrab_ex:classes/cloudbreaker/thunder_seed_missile_end",\
b_assign_as_peer:1,\
}
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evc_torchflower_seeds=1..}] cv_E 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evc_torchflower_seeds=1..}] cv_F 8000
execute if score @a[tag=t_pm_owner,limit=1] evc_torchflower_seeds matches 1.. run function cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_inv_thunder_seed_icon

scoreboard players add @a[tag=t_pm_owner,limit=1,scores={evc_torchflower_seeds=1..,cv_A=1..}] ability_cd_ms 1500

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_torchflower_seeds 0

# Tick down cooldown
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={cv_F=1..}] cv_F -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate

# Speed up cooldown while Nimbus Stride is active
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,cv_F=1..}] cv_F 600

# Award ability
tag @a[tag=t_pm_owner,limit=1,scores={cv_E=0,cv_F=..0}] add t_award_thunder_seed
scoreboard players set @a[tag=t_pm_owner,limit=1,tag=t_award_thunder_seed] cv_E 1
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_thunder_seed] run function cashgrab_ex:classes/cloudbreaker/pmt_cloudbreaker_inv_thunder_seed_icon
tag @a[tag=t_pm_owner,limit=1] remove t_award_thunder_seed

# trinkets/risk_it_biscuit/pmtl_risk_it_biscuit_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Runs when trinket is used
#
# Arguments: (none)

# If player is too low health, do nothing
execute if entity @a[tag=t_pm_owner,limit=1,scores={stat_hp=..6}] run tellraw @a[tag=t_pm_owner] {color:"red","type":text,text:"You don't have the appetite right now."}
execute if entity @a[tag=t_pm_owner,limit=1,scores={stat_hp=..6}] run return run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_modify 1

# Apply potion effects
effect give @a[tag=t_pm_owner,limit=1] minecraft:instant_damage
effect give @a[tag=t_pm_owner,limit=1] minecraft:strength 8 0
effect give @a[tag=t_pm_owner,limit=1] minecraft:speed 8 0

# Create effect timer to grant healing if player scores a kill
function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:160,\
b_anchor_at_pos:0,\
t_timer_name:"t_risk_it_biscuit_effect_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:util/noop",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# Initialize timer
tag @n[tag=t_risk_it_biscuit_effect_timer_init] add t_score_kill_listener
data modify entity @n[tag=t_risk_it_biscuit_effect_timer_init] data.func_npe_score_kill set value "cashgrab_ex:trinkets/risk_it_biscuit/npe_risk_it_biscuit_effect_timer_score_kill"
tag @n[tag=t_risk_it_biscuit_effect_timer_init] add t_risk_it_biscuit_effect_timer
tag @n[tag=t_risk_it_biscuit_effect_timer_init] remove t_risk_it_biscuit_effect_timer_init

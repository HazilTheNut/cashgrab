# classes/pmt_class_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips a class onto the command executor
#
# Arguments: (none)

# Reset ability cooldown
scoreboard players set @a[tag=t_pm_owner] ability_cd_ticks 0
scoreboard players set @a[tag=t_pm_owner] ability_cd_secs 0

# Reset class variables
scoreboard players set @a[tag=t_pm_owner] cv_A 0
scoreboard players set @a[tag=t_pm_owner] cv_B 0
scoreboard players set @a[tag=t_pm_owner] cv_C 0
scoreboard players set @a[tag=t_pm_owner] cv_D 0
scoreboard players set @a[tag=t_pm_owner] cv_E 0
scoreboard players set @a[tag=t_pm_owner] cv_F 0
scoreboard players set @a[tag=t_pm_owner] cv_G 0
scoreboard players set @a[tag=t_pm_owner] cv_H 0

# Reset listenable events
scoreboard players set @a[tag=t_pm_owner] ev_jump 0
scoreboard players set @a[tag=t_pm_owner] ev_dmg_absorbed 0
scoreboard players set @a[tag=t_pm_owner] ev_dmg_dealt 0
scoreboard players set @a[tag=t_pm_owner] ev_dmg_taken 0
scoreboard players set @a[tag=t_pm_owner] ev_maps 0
scoreboard players set @a[tag=t_pm_owner] ev_xpbottles 0
scoreboard players set @a[tag=t_pm_owner] ev_snowballs 0
scoreboard players set @a[tag=t_pm_owner] ev_eggs 0
scoreboard players set @a[tag=t_pm_owner] ev_crossbows 0

effect clear @a[tag=t_pm_owner]

# Run respective class equipment function
execute if score DEVELOPER_MODE num matches 1 if entity @a[tag=t_pm_owner,scores={class=-10}] run function cashgrab:classes/mapmaker/pmt_mapmaker_init

execute if entity @a[tag=t_pm_owner,scores={class=1}] run function cashgrab:classes/griefer/pmt_griefer_init
execute if entity @a[tag=t_pm_owner,scores={class=2}] run function cashgrab:classes/skirmisher/pmt_skirmisher_init
execute if entity @a[tag=t_pm_owner,scores={class=3}] run function cashgrab:classes/spectre/pmt_spectre_init
execute if entity @a[tag=t_pm_owner,scores={class=4}] run function cashgrab:classes/ranger/pmt_ranger_init
execute if entity @a[tag=t_pm_owner,scores={class=5}] run function cashgrab:classes/artillery/pmt_artillery_init
execute if entity @a[tag=t_pm_owner,scores={class=6}] run function cashgrab:classes/champion/pmt_champion_init
execute if entity @a[tag=t_pm_owner,scores={class=7}] run function cashgrab:classes/frostknight/pmt_frostknight_init
execute if entity @a[tag=t_pm_owner,scores={class=8}] run function cashgrab:classes/titan/pmt_titan_init
execute if entity @a[tag=t_pm_owner,scores={class=9}] run function cashgrab:classes/alchemist/pmt_alchemist_init
#execute if entity @a[tag=t_pm_owner,scores={class=10}] run function cashgrab:classes/chronomancer/pmt_chronomancer_init

function cashgrab:base/pmt_inv_refresh
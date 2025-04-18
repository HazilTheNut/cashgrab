# util/pmt_inv_refresh.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Regenerates the player's inventory based on its current state
#
# Arguments:
#	cd_secs		: Cooldown remaining, in seconds

# Erasing armor causes them to re-equip and produce an annoying sound
# So instead, remove everything but armor
item replace entity @a[tag=t_pm_owner] hotbar.0 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.1 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.2 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.3 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.4 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.5 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.6 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.7 with minecraft:air
item replace entity @a[tag=t_pm_owner] hotbar.8 with minecraft:air
item replace entity @a[tag=t_pm_owner] weapon.offhand with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.0 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.1 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.2 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.3 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.4 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.5 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.6 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.7 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.8 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.9 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.10 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.11 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.12 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.13 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.14 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.15 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.16 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.17 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.18 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.19 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.20 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.21 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.22 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.23 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.24 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.25 with minecraft:air
item replace entity @a[tag=t_pm_owner] inventory.26 with minecraft:air

#tellraw @a[tag=t_pm_owner,tag=t_debug] "util/pmt_inv_refresh"

# While in Lobby, display inventory
execute if entity @a[tag=t_pm_owner,scores={activity_state=0..9}] run function cashgrab:base/pmt_inv_lobby

# During class-and-trinket selection, display inventory UI
execute if entity @a[tag=t_pm_owner,scores={activity_state=10..19}] run function cashgrab:base/cts/pmt_cts_inv_main

# During either class-and-trinket selection or gameplay, load class inventory
execute if entity @a[tag=t_pm_owner,scores={activity_state=10..29}] run function cashgrab:classes/pmt_class_inv with entity @s data.class_info

# During class-and-trinket selection, gameplay, or tutorial, load ability icon, trinket, and coin display
execute if entity @a[tag=t_pm_owner,scores={activity_state=10..39}] run function cashgrab:util/pmt_inv_ability_icon_argloader
execute if entity @a[tag=t_pm_owner,scores={activity_state=10..39}] run function cashgrab:util/pmt_inv_trinket_argloader
execute if entity @a[tag=t_pm_owner,scores={activity_state=10..39}] run function cashgrab:util/pmt_inv_coins_argloader

# During Tutorial, display Trainee class
execute if entity @a[tag=t_pm_owner,scores={activity_state=30..39}] run function cashgrab:tutorial/trainee/pmt_trainee_inv

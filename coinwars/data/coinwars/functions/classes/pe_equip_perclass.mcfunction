# classes/pe_equip_perclass.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Equips a class onto the command executor
#
# Arguments:
#	class_id		: Class ID to assign to command executor

$scoreboard players set @s class $(class_id)

# Reset ability cooldown
scoreboard players set @s ability_cd_ticks 0
scoreboard players set @s ability_cd_secs 0

# Reset class variables
scoreboard players set @s cv_A 0
scoreboard players set @s cv_B 0
scoreboard players set @s cv_C 0
scoreboard players set @s cv_D 0
scoreboard players set @s cv_E 0
scoreboard players set @s cv_F 0
scoreboard players set @s cv_G 0
scoreboard players set @s cv_H 0

# Reset consumable events
scoreboard players set @s ev_jump 0
scoreboard players set @s ev_dmg_absorbed 0
scoreboard players set @s ev_dmg_dealt 0
scoreboard players set @s ev_dmg_taken 0
scoreboard players set @s ev_maps 0
scoreboard players set @s ev_xpbottles 0
scoreboard players set @s ev_snowballs 0
scoreboard players set @s ev_eggs 0
scoreboard players set @s ev_crossbows 0

effect clear @s

# Run respective class equipment function
execute if entity @s[scores={class=-1}] run function coinwars:classes/test_a/pe_equip
execute if entity @s[scores={class=-2}] run function coinwars:classes/test_b/pe_equip
execute if entity @s[scores={class=-3}] run function coinwars:classes/test_c/pe_equip
execute if entity @s[scores={class=-4}] run function coinwars:classes/test_c/pe_equip
execute if entity @s[scores={class=-10}] run function coinwars:classes/mapmaker/pe_equip

execute if entity @s[scores={class=1}] run function coinwars:classes/griefer/pe_equip
execute if entity @s[scores={class=2}] run function coinwars:classes/skirmisher/pe_equip
execute if entity @s[scores={class=3}] run function coinwars:classes/spectre/pe_equip
execute if entity @s[scores={class=4}] run function coinwars:classes/ranger/pe_equip
execute if entity @s[scores={class=5}] run function coinwars:classes/artillery/pe_equip
execute if entity @s[scores={class=6}] run function coinwars:classes/champion/pe_equip

function coinwars:base/pe_refresh_inv
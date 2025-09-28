# classes/battlesmith/pmt_battlesmith_inv_scrap.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Scrap counter into inventory based on count
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

# Upgrade weapon sequence timing
#   0   =   Idle
#   3   =   Step 1 icon
#   13  =   Step 2 icon
#   23  =   Step 3 icon
#   33  =   Done
#   34  =   Idle

# Determine if player is elligible to upgrade
execute store result score @a[tag=t_pm_owner,limit=1] temp_A run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_is_upgrade_ready

# Upgrade not available
item replace entity @a[tag=t_pm_owner,limit=1,scores={temp_A=0}] hotbar.5 with minecraft:netherite_scrap[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 1

#   0   =   Idle
item replace entity @a[tag=t_pm_owner,limit=1,scores={temp_A=1,cv_B=0..2}] hotbar.5 with minecraft:anvil[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:item_model="minecraft:netherite_upgrade_smithing_template",\
minecraft:enchantment_glint_override=true,\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 1

#   3   =   Step 1 icon
item replace entity @a[tag=t_pm_owner,limit=1,scores={temp_A=1,cv_B=3..12}] hotbar.5 with minecraft:anvil[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 1

#   13  =   Step 2 icon
item replace entity @a[tag=t_pm_owner,limit=1,scores={temp_A=1,cv_B=13..22}] hotbar.5 with minecraft:anvil[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 2

#   23  =   Step 3 icon
item replace entity @a[tag=t_pm_owner,limit=1,scores={temp_A=1,cv_B=23..32}] hotbar.5 with minecraft:anvil[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 3

#   33  =   Done
#   34  =   Idle
item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_B=33..}] hotbar.5 with minecraft:netherite_scrap[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Crouch)"},{color:"white",text:" Upgrade Weapon"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Crouch holding any item to use."},\
{color:"gray",italic:false,text:"After holding for 1.5 secs,"},\
[{color:"gray",italic:false,text:" spends "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" to upgrade"}],\
{color:"gray",italic:false,text:" your weapon:"},\
[{color:"green",italic:false,text:"Tier II: "},{color:"yellow",italic:false,text:"5 Scrap"}],\
[{color:"green",italic:false,text:"Tier III: "},{color:"yellow",italic:false,text:"12 Scrap"}],\
[{color:"green",italic:false,text:"Tier IV: "},{color:"yellow",italic:false,text:"20 Scrap"}],\
]] 1

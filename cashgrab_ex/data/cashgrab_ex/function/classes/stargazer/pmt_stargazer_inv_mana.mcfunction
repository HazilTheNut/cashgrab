# classes/stargazer/pmt_stargazer_inv_mana.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Scrap counter into inventory based on count
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# Display "0" count if at 0
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:blue_stained_glass_pane[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"[Passive]"},{color:"white",text:" Mana"}],\
minecraft:lore=[\
[{color:"gray",italic:false,text:"You generate "},{color:"aqua",italic:false,text:"1 "},{color:"yellow",italic:false,text:"Mana"}],\
{color:"gray",italic:false,text:" every second."},\
{color:"dark_gray",italic:false,text:"---"},\
[{color:"dark_gray",italic:false,text:"You have "},{color:"aqua",italic:false,text:"0"},{color:"dark_gray",italic:false,text:"/25 Mana."}],\
]] 1

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

# Display current mana count if >= 1
execute store result storage cashgrab_ex:stargazer_args count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_A
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana_count with storage cashgrab_ex:stargazer_args

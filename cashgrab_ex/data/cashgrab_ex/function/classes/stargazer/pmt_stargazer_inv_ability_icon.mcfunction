# classes/stargazer/pmt_stargazer_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# Display "Out of Mana" if insufficent and during gameplay
$item replace entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..24,activity_state=20..29}] hotbar.4 with minecraft:red_stained_glass_pane[\
minecraft:item_name=[{color:"red",italic:false,text:"Out of Mana"}],\
] $(charges)
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..24,activity_state=20..29}] run return 0

# Display if Mana is sufficient
$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:nether_star[\
minecraft:item_name=[{color:"light_purple",italic:false,text:"(Toss)"},{color:"white",text:" Star Shower"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Toss any item to use."},\
{color:"gray",italic:false,text:"Calls in a powerful shower"},\
{color:"gray",italic:false,text:" of stars in front of you."},\
{color:"dark_gray",italic:false,text:"====="},\
[{color:"gray",italic:false,text:"Costs "},{color:"aqua",italic:false,text:"25"},{color:"gray",italic:false,text:" Mana"}]\
]] $(charges)


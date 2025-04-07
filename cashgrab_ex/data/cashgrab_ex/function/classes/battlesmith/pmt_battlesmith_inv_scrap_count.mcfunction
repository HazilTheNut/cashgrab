# classes/battlesmith/pmt_battlesmith_inv_scrap_count.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Scrap counter into inventory based on count
#
# Arguments: 
#   count   :   Number of Scrap collected

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.6 with minecraft:raw_iron[\
minecraft:item_name="[{color:"light_purple",italic:false,text:"[Passive]"},{color:"white",text:" Scrap"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
"[{color:"gray",italic:false,text:"You generate "},{color:"yellow",italic:false,text:"Scrap"},{color:"gray",italic:false,text:" from:"}]",\
"{color:"gold",italic:false,text:"+ Weapon hits"}",\
"[{color:"gold",italic:false,text:"+ "},{color:"yellow",italic:false,text:"Molten Mortar"},{color:"gold",italic:false,text:" hits"}]",\
"{color:"gold",italic:false,text:"+ Collecting coins"}",\
"{color:"dark_gray",italic:false,text:"---"}",\
"[{color:"dark_gray",italic:false,text:"You have "},{color:"yellow",italic:false,text:"$(count)"},{color:"dark_gray",italic:false,text:"/20 Scrap."}]",\
]] $(count)

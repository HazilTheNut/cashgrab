# classes/champion/pmt_champion_inv_bastion.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Bastion (shield) item
#
# Arguments: 
#   shield_slot    :   which slot to insert into
#   shield_damage  :   durability damage amount

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Bastion (shield) durability/hits remaining
#	cv_F	:	Bastion (shield) refresh cooldown, in ms
#	cv_G	:	
#	cv_H	:	

$item replace entity @a[tag=t_pm_owner,limit=1] $(shield_slot) with minecraft:shield[\
minecraft:damage=$(shield_damage),\
minecraft:custom_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Bastion\"}",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This shield breaks after\"}",\
"[{\"color\":\"gray\",\"italic\":false,\"text\":\" blocking \"},{\"color\":\"aqua\",\"italic\":false,\"text\":\"5\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" hits.\"}]",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Each hit blocked reduces\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" your Valiant Charge cooldown.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"This ability recharges itself\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" 4\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" seconds after use.\"}]"\
]\
]

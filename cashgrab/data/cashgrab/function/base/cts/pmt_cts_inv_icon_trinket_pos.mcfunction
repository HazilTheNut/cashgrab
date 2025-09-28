# base/cts/pmt_cts_inv_icon_trinket_pos.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts trinket position configuration icon item into the provided slot
#
# Arguments:
#	slot	:	Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1,scores={trinket_cfg_pos=0}] $(slot) with minecraft:clay_ball[\
minecraft:item_model="minecraft:gray_bundle",\
minecraft:item_name=[{color:"gold",italic:false,text:"<Trinket Pos> "},{color:"gray",italic:false,text:"Class-Defined"}]\
] 1 

$item replace entity @a[tag=t_pm_owner,limit=1,scores={trinket_cfg_pos=1}] $(slot) with minecraft:clay_ball[\
minecraft:item_model="minecraft:lime_bundle",\
minecraft:item_name=[{color:"gold",italic:false,text:"<Trinket Pos> "},{color:"green",italic:false,text:"Fixed Hotbar"}]\
] 1 
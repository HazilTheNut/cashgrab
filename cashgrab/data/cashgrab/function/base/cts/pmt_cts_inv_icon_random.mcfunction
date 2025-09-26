# base/cts/pmt_cts_inv_icon_random.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts random selection icon item into the provided slot
#
# Arguments:
#	slot	:	Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:magenta_glazed_terracotta[minecraft:item_name=[{color:"gold",italic:false,text:"<Random>"}]] 1 

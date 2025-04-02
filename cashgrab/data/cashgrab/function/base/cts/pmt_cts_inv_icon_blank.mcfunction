# base/cts/pmt_cts_inv_icon_blank.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts a "blank" item into the provided slot
#
# Arguments:
#	slot	:	Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:light_gray_stained_glass_pane[minecraft:item_name=[{color:"dark_gray",italic:false,text:"-"}]] 1


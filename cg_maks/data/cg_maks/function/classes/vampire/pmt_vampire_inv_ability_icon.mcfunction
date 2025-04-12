# classes/vampire/pmt_vampire_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:clay_ball[\
minecraft:item_model="minecraft:wind_charge",\
minecraft:item_name=[{color:"light_purple",italic:false,text:"[Toss]"},{color:"white",text:" Soul Siphon"}],\
minecraft:lore=[\
[{text:"Toss any item to use.",color:"dark_gray"}],\
[{text:"Summons a homing swarm of bats",italic:false,color:"gray"}],\
[{text:" that damages and ",italic:false,color:"gray"},{text:"Marks",italic:false,color:"yellow"},{text:" enemies.",italic:false,color:"gray"}],\
[{text:"Marked ",italic:false,color:"yellow"},{text:"enemies are weakened and",italic:false,color:"gray"}],\
[{text:" drop a",italic:false,color:"gray"},{text:" ",italic:false},{text:"Remnant ",italic:false,color:"dark_red"},{text:"if they are killed.",italic:false,color:"gray"}],\
[{text:"Remnants",italic:false,color:"dark_red"},{text:" can be picked up to",italic:false,color:"gray"}],\
[{text:" restore some health.",italic:false,color:"gray"}],\
[{text:"====",italic:false,color:"dark_gray"}],\
[{text:"20 ",italic:false,color:"yellow"},{text:"sec cooldown for ",italic:false,color:"gray"},{text:"1 ",italic:false,color:"yellow"},{text:"charge",italic:false,color:"gray"}],\
[{text:"(Each target marked",italic:true,color:"dark_gray"}],\
[{text:" reduces the cooldown)",italic:true,color:"dark_gray"}]\
]] $(charges)

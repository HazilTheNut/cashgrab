# tutorial/sequence/stage_coins/pmt_give_transcript.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Grants transcript item for the current tutorial sequence stage
#
# Arguments: (none)

give @a[tag=t_pm_owner,limit=1] minecraft:paper[\
minecraft:item_name={color:"aqua",italic:false,text:"Transcript"},\
minecraft:lore=[\
{italic:false,color:"dark_gray",text:"--------------------------------------------"},\
[{italic:false,color:"white",text:"The main objective of the game is to "},{italic:false,color:"gold",text:"collect coins"},{italic:false,color:"white",text:"."}],\
[{italic:false,color:"white",text:" You can do so by "},{color:"gold",text:"stepping on gold pressure plates"},{italic:false,color:"white",text:","}],\
[{italic:false,color:"white",text:" such as the one up ahead."}],\
{italic:false,color:"dark_gray",text:""},\
{italic:false,color:"gray",text:"When you die during gameplay, you will drop half your stash"},\
{italic:false,color:"gray",text:" of coins on the ground (not shown in the tutorial)."},\
{italic:false,color:"dark_gray",text:""},\
{italic:false,color:"yellow",text:"To continue, collect some coins."}\
]\
] 1

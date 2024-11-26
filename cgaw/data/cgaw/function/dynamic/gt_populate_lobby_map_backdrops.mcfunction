#	x coord = 28
#	col = z coord = 56 + col + 0/6/12 for small/medium/large
#	row = y coord = -19 + row

# --- Map selection backdrop
fill 28 -18 57 28 -18 59 minecraft:polished_blackstone
fill 28 -18 63 28 -18 65 minecraft:polished_blackstone
fill 28 -18 69 28 -18 71 minecraft:polished_blackstone

# Place gold block behind selected map
execute if score CGAW_CFG_MAP_ID num matches 101 run setblock 28 -18 57 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 102 run setblock 28 -18 58 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 103 run setblock 28 -18 59 minecraft:gold_block

execute if score CGAW_CFG_MAP_ID num matches 201 run setblock 28 -18 63 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 202 run setblock 28 -18 64 minecraft:gold_block

execute if score CGAW_CFG_MAP_ID num matches 301 run setblock 28 -18 69 minecraft:gold_block
execute if score CGAW_CFG_MAP_ID num matches 302 run setblock 28 -18 70 minecraft:gold_block

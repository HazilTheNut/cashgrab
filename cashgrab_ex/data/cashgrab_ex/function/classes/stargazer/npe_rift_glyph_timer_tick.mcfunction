# classes/stargazer/npe_rift_glyph_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Rift Glyph timer tick function
#
# Arguments: (none)

# Fall to the ground
execute if block ~ ~-1 ~ #cashgrab:nonsolid align y run tp @s ~ ~-1 ~

# vfx
particle minecraft:dust{color:[1.0,0.9,0.8],scale:0.8} ~ ~0.1 ~ 0.35 0 0 0 1
particle minecraft:dust{color:[1.0,0.9,0.8],scale:0.8} ~ ~0.1 ~ 0 0 0.35 0 1

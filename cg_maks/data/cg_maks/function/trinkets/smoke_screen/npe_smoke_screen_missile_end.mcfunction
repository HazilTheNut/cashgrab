# trinkets/smoke_screen/npe_smoke_screen_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Smoke Screen missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

#Check the end reason
$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# Effects
particle minecraft:squid_ink ~ ~ ~ 0.5 0.5 0.5 1 50 force
particle minecraft:squid_ink ~ ~ ~ 0.5 0.5 0.5 1 50
particle minecraft:dust{color:[0.0f,0.0f,0.0f],scale:1.0} ~ ~ ~ 3 3 3 0 50
playsound minecraft:entity.glow_squid.squirt player @a ~ ~ ~ 1 1

#Apply blindness to anyone within 3 blocks of the missile's endpoint
effect give @a[distance=..3] blindness 6 0
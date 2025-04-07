# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

tellraw @a[tag=t_pm_owner,limit=1] [{"type":text,text:"-----"}]
$tellraw @a[tag=t_pm_owner,limit=1] [{"type":text,text:"Pos: "},{"type":text,text:"$(player_pos_x) $(player_pos_y) $(player_pos_z)","clickEvent": {"action":"copy_to_clipboard","value": "$(player_pos_x) $(player_pos_y) $(player_pos_z)"},color:"aqua","underlined":true},{"type":text,text:" Rot: "},{"type":text,text:"$(player_rot_yaw) $(player_rot_pitch)","clickEvent": {"action":"copy_to_clipboard","value": "$(player_rot_yaw) $(player_rot_pitch)"},color:"aqua","underlined":true}]
$tellraw @a[tag=t_pm_owner,limit=1] [{"type":text,text:"Relative to anchor: "},{"type":text,text:"$(player_rel_x) $(player_rel_y) $(player_rel_z)","clickEvent": {"action":"copy_to_clipboard","value": "$(player_rel_x) $(player_rel_y) $(player_rel_z)"},color:"aqua","underlined":true}]

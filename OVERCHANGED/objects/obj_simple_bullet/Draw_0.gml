if (point_in_rectangle(x, y, obj_battle_box.bb_left, obj_battle_box.bb_top, obj_battle_box.bb_right, obj_battle_box.bb_bottom))
	draw_self()

if (debug_mode)
{
	draw_set_colour(c_red)
	draw_set_alpha(0.5)
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false)
}
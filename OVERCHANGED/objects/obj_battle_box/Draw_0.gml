var _width  = bb_right - bb_left
var _height = bb_bottom - bb_top

draw_sprite_stretched(sprite_index, image_index, bb_left, bb_top, _width, _height)

if (my_line != "")
{
	draw_set_font(global.font)
	draw_set_colour(c_white)
	draw_text(target_left + 16, target_top + 8, my_line)
}
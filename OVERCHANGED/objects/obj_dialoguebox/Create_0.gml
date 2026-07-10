function start_dialogue()
{
	tcxt = createtext(x - (sprite_get_width(sprite_index) / 2) + 30.1,
	y - (sprite_get_height(sprite_index)) +10,
	depth - 1 ,"Beep boop bep bop skdoo beep pobee", 2.34, 17.5, 230,101,101)
	tcxt.image_blend = c_white
	tcxt.depth = depth - 1
}
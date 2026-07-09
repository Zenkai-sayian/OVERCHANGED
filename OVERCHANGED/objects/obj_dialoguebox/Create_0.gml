function start_dialogue()
{
	tcxt = createtext(x - (sprite_get_width(sprite_index) + 5), y - (sprite_get_height(sprite_index)) + 8,"characters","WHOA!",1.1,25.5,50,80,80)
	tcxt.image_blend = c_white
	tcxt.depth = depth - 1
	tcxt.typee = "ndialogue"
}
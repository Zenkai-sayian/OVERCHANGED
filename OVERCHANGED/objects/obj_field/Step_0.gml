if (keyboard_check_pressed(global.CONFIRM))
{
	bar.speed = 0
	bar.image_speed = 2
	hit = dist(bar.x, perfect_hit)
	if (hit < 15)
		mult = 2
	show_debug_message(hit)
	alarm[0] = 40
}
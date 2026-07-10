event_inherited()

x += spd

if (keyboard_check_pressed(global.CONFIRM))
{
	image_speed = 1.5
	spd = 0
	if (abs(x - center) < 10)
	{
		multipler = 2
	}
	else
	{
		multiplier = 1
	}
	dmg = round(global.at * multiplier + int64(random_range(0, 2)))
	alarm[0] = 30
}

if (x > 300)
{
	instance_destroy()
}
fade_alpha += fade_speed * fade_state
fade_alpha = clamp(fade_alpha, 0, 1)

if (fade_alpha == 1 && fade_state == 1)
{
	fade_state = -1
	if (room_exists(target_room))
	{
		room_goto(target_room)
	}
}

if (fade_alpha == 0 && fade_state == -1)
	instance_destroy()
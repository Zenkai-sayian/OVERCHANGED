event_inherited()

fade_alpha += fade_speed * fade_state
fade_alpha = clamp(fade_alpha, 0, 1)
print([fade_alpha])

if (fade_alpha == 1 && fade_state == 1)
{
	
	if run_once = 0
	{
		if (room_exists(target_room))
		{
			room_goto(target_room)
			var yea = find(obj_plrmove)
			if  yea != noone 
			{ 
				yea.x = location[0]
				yea.y = location[1]
				yea.enablemovement = true
			}
		}
		alarm[0] = 20
		run_once = 1
	}
	
}

if (fade_alpha == 0 && fade_state == -1)
	instance_destroy()
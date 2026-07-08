event_inherited()

var movex = (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd 
var movey =(keyboard_check(vk_down) - keyboard_check(vk_up)) * spd 
x += movex
y += movey

if actor != noone and variable_instance_exists(id,actor)
{
	if movex = 0 and movey = 0

	{
		actor.image_speed = 0
		print(["yes"])
	}
	else
	{
		actor.image_speed = 1
	}
}

print([movex,movey,actor,variable_instance_exists(id,actor)])
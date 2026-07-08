event_inherited()


//movement
var movex = (keyboard_check(global.RIGHT) - keyboard_check(global.LEFT)) * spd 
var movey =(keyboard_check(global.DOWN) - keyboard_check(global.UP)) * spd 
x += movex
y += movey

if actor != noone and variable_instance_exists(id,"actor")
{
	
	//sets animation speed if idle
	if movex = 0 and movey = 0
	{
		actor.image_index = 0.99
		actor.image_speed = 0
		print(["yes"])
	}
	else
	{
		actor.image_speed = 1
	}
	
	//sets sprite
	if keyboard_check(global.UP)
	{
		actor.sprite_index = spr_krisup
	}
	else if keyboard_check(global.RIGHT)
	{
		actor.sprite_index = spr_krisright
	}
	else if keyboard_check(global.LEFT)
	{
		actor.sprite_index = spr_krisleft
	}
	else if keyboard_check(global.DOWN)
	{
		actor.sprite_index = spr_krisdown
	}
}

print([movex,movey,actor,variable_instance_exists(id,"actor")])
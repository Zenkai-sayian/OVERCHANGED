event_inherited()


//movement
var movex = (keyboard_check(global.RIGHT) - keyboard_check(global.LEFT)) * spd 
var movey =	(keyboard_check(global.DOWN) - keyboard_check(global.UP)) * spd 

for (var i = 0; i < array_length(global.collideables); i++)
{
	if place_meeting(x + movex, y, global.collideables[i])
	{
		movex = 0
	}
	if place_meeting(x, y + movey, global.collideables[i])
	{
		movey = 0
	}
}

x += movex
y += movey

if actor != noone and variable_instance_exists(id,"actor")
{
	
	//sets animation speed if idle
	if movex = 0 and movey = 0
	{
		actor.image_index = 0.99
		actor.image_speed = 0
	}
	else
	{
		actor.image_speed = 1
	}
	
	//sets sprite
	if keyboard_check(global.UP)
	{
		actor.sprite_index = spr_krisup
		state = 1
	}
	else if keyboard_check(global.RIGHT)
	{
		actor.sprite_index = spr_krisright
		state = 2
	}
	else if keyboard_check(global.LEFT)
	{
		actor.sprite_index = spr_krisleft
		state = 3
	}
	else if keyboard_check(global.DOWN)
	{
		actor.sprite_index = spr_krisdown
		state = 0
	}
}

var deff = function()
{
	
	if keyboard_check_pressed(global.CONFIRM)
	{
		print([instance_nearest(x,y,obj_npc).dialogue[0]])
	}
}

print([state])
switch state 
{
	case 0:
		if place_meeting(x, y + space, obj_npc)
		{
			deff()
		}
	case 1:
		if place_meeting(x, y - space, obj_npc)
		{
			deff()
		}
	case 2:
		if place_meeting(x + space, y, obj_npc)
		{
			deff()
		}
	case 3:
		if place_meeting(x - space, y, obj_npc)
		{
			deff()
		}
}

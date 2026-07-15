event_inherited()

var movex = (keyboard_check(global.RIGHT) - keyboard_check(global.LEFT)) * spd * enablemovement
var movey =	(keyboard_check(global.DOWN) - keyboard_check(global.UP)) * spd * enablemovement

if (enablemovement)
{
	x += movex
	y += movey
}

if (iframes)
{
	iframes--
}

if (iframes > 0 && iframes % 2 == 0)
{
	actor.image_index = 1
}
else
{
	actor.image_index = 2
}
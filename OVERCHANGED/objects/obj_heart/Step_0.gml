event_inherited()

var movex = (keyboard_check(global.RIGHT) - keyboard_check(global.LEFT)) * spd * enablemovement
var movey =	(keyboard_check(global.DOWN) - keyboard_check(global.UP)) * spd * enablemovement

if (enablemovement)
{
	x += movex
	y += movey
}
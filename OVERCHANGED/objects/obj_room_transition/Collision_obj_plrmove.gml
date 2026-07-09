if (!instance_exists(obj_fade))
{
	fader = instance_create_depth(0, 0, -999, obj_fade)
	fader.target_room = target
	fader.target = [set_x, set_y]
}
other.enablemovement = false

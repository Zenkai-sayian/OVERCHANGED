if (!instance_exists(obj_fade))
{
	fader = instance_create_depth(0, 0, -999, obj_fade,
	{target_room : target,
	location : [set_x, set_y]})
	print([set_x, set_y])
}
other.enablemovement = false

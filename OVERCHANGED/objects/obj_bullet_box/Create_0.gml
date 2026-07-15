manager = instance_find(obj_fightmanager, 0)
if (!instance_exists(manager))
	show_debug_message("couldn't find obj_fightmanager")

heart = instance_find(obj_heart, 0)
if (!instance_exists(heart))
	show_debug_log("couldn't find obj_heart")


if (turn == 0)
{
	if (keyboard_check_pressed(global.LEFT))
	{
		menu_select = max(menu_select - 1, 0)
	}
	if (keyboard_check_pressed(global.RIGHT))
	{
		menu_select = min(menu_select + 1, 3)
	}
}

hp_fill_ratio = global.hp / global.maxhp
hp_fill_ratio = clamp(hp_fill_ratio, 0, 1)